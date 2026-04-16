# Página Web de Hotel - Back End

## Introducción

Este proyecto corresponde a la parte BackEnd para página web de un hotel. 
Maneja la lógica para la conexión del FrontEnd con la base de datos. 
La API se encuentra en el archivo `app.py`, y la base de datos necesaria se encuentra en la carpeta `sql`.

## Propósito y Objetivos

El propósito de este proyecto es proporcionar la lógica y las funciones necesarias para que el FrontEnd pueda interactuar con la base de datos de manera segura y eficiente.

## Instrucciones de Instalación

### Requisitos Previos

- Python
- Flask
- Flask-CORS
- pip
- Node.js
- MySQL
- XAMPP o Azure

### Pasos de Instalación del Back End

1. Abre la terminal.

2. Clona el repositorio desde GitHub.
    git clone https://github.com/DarioValeriano/Artemisa-Hotel-TP-IDS

3. Ingresa a la carpeta del BackEnd.
    cd BackEnd-API

4. Ejecuta el script `backend.sh` de instalación de dependencias.
    bash backend.sh

5. Activa el entorno virtual.
    pipenv shell

6. Ejecuta la aplicación Flask.
    flask run

6. Configura la base de datos:
    - Abre PhpMyAdmin (o tu herramienta de gestión de MySQL preferida).
    - Crea una nueva base de datos. La misma se tiene que llamar `proyecto_messi`.
    - Importa el archivo SQL desde la carpeta `sql` del proyecto. El archivo se llama `proyecto_messi.sql`
   
      # Instrucciones para importar la base de datos en PhpMyAdmin:
      1. Abre PhpMyAdmin y navega a la pestaña "Bases de datos".
      2. Crea una nueva base de datos con el nombre que desees.
      3. Selecciona la nueva base de datos y navega a la pestaña "Importar".
      4. Haz clic en "Elegir archivo" y selecciona el archivo SQL ubicado en la carpeta `sql` del proyecto.
      5. Haz clic en "Continuar" para importar la base de datos.

## Uso del Proyecto

1. Asegúrate de que la base de datos está corriendo con XAMPP o Azure.
2. El front end se conectará automáticamente al back end para interactuar con la base de datos.



