# Página Web de Hotel - Front End

## Introducción

Este proyecto corresponde al FrontEnd de una página web para un hotel.

La página web tiene seis secciones principales:
- **Home**: Resumen de lo que ofrece el hotel y opción para dejar una reseña.
- **Habitaciones**: Detalle de cada tipo de habitación y opción para reservar.
- **Servicios**: Información sobre todas las amenities del hotel.
- **FAQ**: Espacio de preguntas frecuentes.
- **Contacto**: Formulario para dejar una consulta al hotel.
- **Reservas**: Formulario para alojarse en el hotel.

El mismo está desarrollado dentro de un entorno virtual utilizando el framework Flask y se conecta con la API a través del archivo `app.py`.

## Propósito y Objetivos

El propósito de este proyecto es proporcionar una interfaz amigable y funcional para que los usuarios puedan interactuar con el hotel, ver las habitaciones y servicios disponibles, y realizar reservas de manera eficiente.

## Instrucciones de Instalación

### Requisitos Previos

- **Python**: [Descargar e instalar Python](https://www.python.org/downloads/)
    - **pip**: Viene incluido con Python, pero asegúrate de tenerlo actualizado.
        python -m pip install --upgrade pip
    - **pipenv**: Instala pipenv para manejar el entorno virtual.
        pip install pipenv
- **MySQL**: [Descargar e instalar MySQL](https://dev.mysql.com/downloads/mysql/)
- **XAMPP o Azure**: [Descargar e instalar XAMPP](https://www.apachefriends.org/download.html) o configurar Azure según tus necesidades.

### Pasos de Instalación FrontEnd

1. Abrir la terminal.

2. Clona el repositorio desde GitHub:
    git clone https://github.com/DarioValeriano/Artemisa-Hotel-TP-IDS

3. Ingresá a la carpeta del FrontEnd:
    cd Artemisa-Hotel-TP-IDS/FrontEnd

4. Ejecuta el script `frontend.sh` de instalación de dependencias:
    bash frontend.sh

5. Activa el entorno virtual:
    pipenv shell

6. Ejecuta la aplicación Flask:
    flask run

## Uso del Proyecto

1. Abre tu navegador y ve a `http://localhost:<puerto_front_end>`.
2. Explora las diferentes secciones de la página web.
3. Utiliza el formulario de reservas para realizar una reserva.
4. Deja una reseña o consulta a través de los formularios disponibles.

## Licencia

Este proyecto está licenciado bajo la MIT License.

