from flask import Flask, render_template, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine
from sqlalchemy import text
from sqlalchemy.exc import SQLAlchemyError
from flask_cors import CORS
import json

PORT = 5001

app = Flask(__name__)
CORS(app)

def set_connection():
    engine = create_engine("mysql+mysqlconnector://root:@localhost/proyecto_messi")
    connection = engine.connect()
    return connection

def verificar_disponibilidad_tipo(conn, roomtype):
    query_disponibilidad = """
    SELECT id_habitacion FROM habitaciones_disponibles 
    WHERE nombre_habitacion = :roomtype
    """
    result_disponibilidad = conn.execute(text(query_disponibilidad), {'roomtype': roomtype}).fetchall()
    return [row[0] for row in result_disponibilidad]

def verificar_disponibilidad_fecha(conn, habitaciones_disponibles, checkin, checkout):
    habitaciones_libres = []
    for habitacion in habitaciones_disponibles:
        query_reservas_existente = """
        SELECT COUNT(*) FROM ocupacion_hotel 
        WHERE id_habitacion = :habitacion 
        AND (:checkout > fecha_checkin AND :checkin < fecha_checkout)
        """
        result_reservas_existente = conn.execute(text(query_reservas_existente), {'habitacion': habitacion, 'checkout': checkout, 'checkin': checkin}).scalar()
        if result_reservas_existente == 0:
            habitaciones_libres.append(habitacion)
    return habitaciones_libres

def insertar_cliente(conn, nombre, apellido, identificacion, telefono):
    query_insertar_cliente = """INSERT INTO cliente (nombre, apellido, identificacion, telefono) 
                            VALUES (:nombre, :apellido, :identificacion, :telefono)"""
    result_insertar_cliente = conn.execute(text(query_insertar_cliente), {'nombre': nombre, 'apellido': apellido, 'identificacion': identificacion, 'telefono': telefono})
    return result_insertar_cliente.lastrowid

def insertar_ocupacion(conn, id_habitacion, checkin, checkout):
    query_insertar_ocupacion = """INSERT INTO ocupacion_hotel (id_habitacion, fecha_checkin, fecha_checkout) 
                            VALUES (:id_habitacion, :checkin, :checkout)"""
    conn.execute(text(query_insertar_ocupacion), {'id_habitacion': id_habitacion, 'checkin': checkin, 'checkout': checkout})

def insertar_reserva(conn, id_cliente, id_habitacion, roomtype, checkin, checkout, persons, bedtype):
    query_insertar_reserva = """INSERT INTO reserva (id_cliente, id_habitacion, nombre_habitacion, fecha_checkin, fecha_checkout,     
                            cantidad_huespedes, tipo_cama) 
                            VALUES (:id_cliente, :id_habitacion, :roomtype, :checkin, :checkout, :persons, :bedtype)"""
    conn.execute(text(query_insertar_reserva), {'id_cliente': id_cliente, 'id_habitacion': id_habitacion, 'roomtype': roomtype, 'checkin': checkin, 'checkout': checkout, 'persons': persons, 'bedtype': bedtype})

def insertar_resena(conn, nombre, titulo_resena, resena, satisfaccion):
    query_instertar_resenas = """INSERT INTO resenas (nombre, titulo_resena, resena, satisfaccion)
                                VALUES (:nombre, :titulo_resena, :resena, :satisfaccion)"""
    conn.execute(text(query_instertar_resenas), {'nombre': nombre, 'titulo_resena': titulo_resena, 'resena': resena, 'satisfaccion': satisfaccion})

@app.route('/generar_reservas', methods=['GET', 'POST'])
def generar_reservas():
    conn = set_connection()

    data = request.json

    nombre = data.get('nombre')
    apellido = data.get('apellido')
    identificacion = data.get('identificacion')
    contact = data.get('contact')
    checkin = data.get('checkin')
    checkout = data.get('checkout')
    roomtype = data.get('roomtype')
    persons = data.get('persons')
    bedtype = data.get('bedtype')
    
    try:
        habitaciones_disponibles = verificar_disponibilidad_tipo(conn, roomtype)

        habitaciones_libres = verificar_disponibilidad_fecha(conn, habitaciones_disponibles, checkin, checkout)

        id_habitacion = habitaciones_libres[0]

        id_cliente = insertar_cliente(conn, nombre, apellido, identificacion, contact)

        insertar_ocupacion(conn, id_habitacion, checkin, checkout)
 
        insertar_reserva(conn, id_cliente, id_habitacion, roomtype, checkin, checkout, persons, bedtype)

        conn.commit()
        return jsonify({'message': 'Reserva realizada con éxito!'}), 201
    except Exception as e:
        return jsonify({'message': f'Error en el servidor: {str(e)}'}), 500
    finally:
        conn.close()

@app.route('/informacion_habitaciones', methods=['GET'])
def obtener_info_habitaciones():
    conn = set_connection()

    query_obtener_info = "SELECT * FROM tipos_habitaciones"
    
    try:
        result = conn.execute(text(query_obtener_info))
        conn.close()
    except SQLAlchemyError as err:
        return jsonify({'message': 'Se ha producido un error en la base de datos: ' + str(err.__cause__)}), 500

    data = []
    
    for row in result:
        entity = {}
        entity['nombre']= row[0]
        entity['descripcion']= row[1]
        entity['amenities']= json.loads(row[2]) if row[2] else None
        entity['ruta_imagen1']= row[3]
        entity['ruta_imagen2']= row[4]
        entity['ruta_imagen3']= row[5]
        data.append(entity)

    return jsonify(data), 200
 

@app.route('/contenido_resenas', methods=['GET'])
def obtener_contenido_resenas():
    conn = set_connection()

    query_obtener_info = "SELECT * FROM resenas"
    query_promedio_satisfaccion = "SELECT AVG(satisfaccion) AS promedio_satisfaccion FROM resenas"
    query_cantidad_resenas = "SELECT COUNT(*) AS cantidad_resenas FROM resenas"
    

    try:
        resenas = conn.execute(text(query_obtener_info)).fetchall()
        promedio_satisfaccion_result = conn.execute(text(query_promedio_satisfaccion)).fetchone()[0] 
        cantidad_resenas_result = conn.execute(text(query_cantidad_resenas)).fetchone()[0] 
    
        conn.close()
    except SQLAlchemyError as err:
        return jsonify({'message': 'Se ha producido un error en la base de datos: ' + str(err.__cause__)}), 500

    data = []

    for fila in resenas:
        entity = {}
        entity['id_resena'] = fila[0]
        entity['nombre'] = fila[1]
        entity['titulo_resena'] = fila[2]
        entity['resena'] = fila[3]
        entity['satisfaccion'] = fila[4]
        data.append(entity)

    return jsonify({'resenas': data, 'cantidad_resenas': cantidad_resenas_result, 'promedio_satisfaccion': promedio_satisfaccion_result}), 200


@app.route('/generar_resenas', methods=['GET', 'POST'])
def generar_resenas():

    conn = set_connection()
    data = request.json

    nombre = data.get('nombre')
    titulo_resena = data.get('titulo_resena')
    resena = data.get('resena')
    satisfaccion = data.get('satisfaccion')
    
    try:
        
        insertar_resena(conn, nombre, titulo_resena, resena, satisfaccion)

        conn.commit()
        return jsonify({'message': 'Gracias por tu valoracion!'}), 201

    except Exception as e:
        return jsonify({'message': f'Error en el servidor: {str(e)}'}), 500
    finally:
        conn.close()

def insertar_consulta(conn, name, contact, email, message):
    query = """INSERT INTO consultas (name, contact, email, message)
                    VALUES (:name, :contact, :email, :message)"""
    conn.execute(text(query), {'name': name, 'contact': contact, 'email': email, 'message': message}) 

@app.route('/crear_consulta', methods=['POST'])
def crear_consulta():
    conn = set_connection()
    try:
        data = request.json
        name = data.get('name')
        contact = data.get('contact')
        email = data.get('email')
        message = data.get('message')

        insertar_consulta(conn, name, contact, email, message)

        conn.commit()
        return jsonify({'message': 'Consulta enviada correctamente'}), 201
    except Exception as err:
        return jsonify({'message': f'Error en el servidor: {str(err)}'}), 500
    finally:
        conn.close()



@app.route('/informacion_servicios', methods=['GET'])
def informacion_servicios():
    conn = set_connection()
    query = "SELECT * FROM servicios;"
    try:
        result = conn.execute(text(query))
        conn.close() 
    except SQLAlchemyError as err:
        return jsonify(str(err.__cause__))
    
    data = []
    for row in result:
        entity = {}
        entity['nombre_servicio'] = row.nombre_servicio
        entity['descripcion_servicio'] = row.descripcion_servicio
        entity['ruta_imagen1'] = row.ruta_imagen1
        entity['ruta_imagen2'] = row.ruta_imagen2
        entity['ruta_imagen3'] = row.ruta_imagen3
        data.append(entity)
    
    return jsonify(data)



@app.route('/informacion_faq', methods=['GET'])
def obtener_info_faq():
    conn = set_connection()

    query_obtener_info = "SELECT * FROM FAQ"
    
    try:
        faq = conn.execute(text(query_obtener_info)).fetchall()
        conn.close()
    except SQLAlchemyError as err:
        return jsonify({'message': 'Se ha producido un error en la base de datos: ' + str(err._cause_)}), 500

    data = []
    
    for row in faq:
        entity = {}
        entity['ID'] = row[0]
        entity['Pregunta'] = row[1]
        entity['Respuesta'] = row[2]
        data.append(entity)

    return jsonify({'faq':data}), 200



if __name__ == "__main__":
    app.run(debug=True, port=PORT)