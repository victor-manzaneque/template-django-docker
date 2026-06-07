# 🐳 Plantilla de Desarrollo Django + Docker (Llave en Mano)

> 🌍 **Language Versions:** [Español](README.md) | [English](README.en.md)

Este proyecto es una plantilla automatizada para desplegar entornos de desarrollo de **Django** utilizando **Docker**. Está diseñada bajo el principio de portabilidad absoluta, permitiendo cambiar de equipo de trabajo al instante sin preocuparse por la instalación de Python, entornos virtuales o incompatibilidad de dependencias.

---

## 🚀 Requisitos Previos

Antes de comenzar, asegúrate de tener instalado y ejecutándose en tu sistema:
* [Docker Desktop](https://www.docker.com/products/docker-desktop/)

---

## 📦 Guía de Uso Paso a Paso

Sigue estos pasos para inicializar tu propio proyecto desde cero utilizando esta plantilla:

### Paso 1: Crear la carpeta de tu nuevo proyecto
Para evitar conflictos de nombres en Docker y mantener tus proyectos organizados, **no trabajes dentro de la carpeta de la plantilla**. 
1. Crea una nueva carpeta en tu equipo con el nombre que quieras para tu aplicación (por ejemplo: `mi_app_biblioteca`).
2. Copia los siguientes archivos de la plantilla y pégalos dentro de la carpeta que acabas de crear:
   * `docker-compose.yml`
   * `Dockerfile`
   * `requirements.txt`
   * `start_project.bat`

> 💡 *Al hacerlo así, Docker Compose bautizará el contenedor automáticamente con el nombre de tu carpeta (`mi_app_biblioteca`), manteniéndolo completamente aislado de otros proyectos.*

---

### Paso 2: Inicializar el proyecto con el Asistente
Haz doble clic sobre el archivo **`start_project.bat`** (en sistemas Windows). 

**¿Cómo se comporta el script?**
* **Primera ejecución:** El script detectará que la estructura de Django aún no existe. Te pedirá de forma interactiva en la consola que **introduzcas el nombre del proyecto Django** (ej. `my_digital_books` o `web_tienda_deportes`). Docker generará los archivos limpios en tu máquina local y, acto seguido, levantará el servidor.
* **Siguientes ejecuciones:** El script detectará que el proyecto ya está creado, omitirá las preguntas y levantará directamente tus contenedores con `docker compose up`. Este proceso es totalmente automático y no es necesario repetir a menos que elimines el contenedor.

El servidor web estará disponible de inmediato en: **`http://localhost:8000`**

---

### Paso 3: Configurar la Base de Datos y el Administrador
Una vez que veas el cohete de Django en el navegador, debes preparar la base de datos local (SQLite3) y crear tu cuenta de acceso al panel de control.

Antes de ejecutar los comandos, echa un vistazo a **Docker Desktop** para asegurarte de que el contenedor de tu proyecto está en verde (`Running`). Con el contenedor activo, abre la terminal de docker (esquina inferior derecha):

1. **Aplicar las Migraciones Iniciales:**
   Crea el archivo `db.sqlite3` local y genera las tablas necesarias para el sistema de autenticación, introduce estes comando en la terminal:

   `docker compose exec web python manage.py migrate`

2. **Crear el Superusuario Administrador:**
    Lanza el asistente interactivo para configurar tus credenciales, introduce este comando en la terminal:

    `docker compose exec web python manage.py createsuperuser`

    Introduce tu usuario y contraseña (los caracteres no se mostrarán al escribir por seguridad, puedes omitir el email).

Ya puedes gestionar tu aplicación entrando en: **`http://localhost:8000/admin`**


💾 Notas de Desarrollo
    Sincronización en tiempo real: Gracias al volumen compartido (.:/code), cualquier cambio que hagas en tu código desde tu IDE (como VS Code) se reflejará inmediatamente dentro de Docker y Django reiniciará el servidor de forma automática. En definitiva, los archivos de tu app se encuentran
    alojados dentro de tu máquina y no en el contenedor de docker, por lo que es totalmetne desechable. La base de datos es totalmente persistente, ya
    que si eliminas el contenedor NO IMPORTA!, tus archivos seguirán exactamente donde los dejaste, si quieres volver a levantar el contenedor, simplemente ejecuta el archivo star_project.bat.

    Librerías incluidas: La plantilla viene preconfigurada con Django, Pillow (gestión de imágenes) y Django REST Framework (por si necesitas desarrollar APIs). Puedes añadir más librerías editando el archivo requirements.txt y reconstruyendo el contenedor. Si quieres instalar más librerias, simplemente necesitas que docker y el contenedor esten corriendo, abrir la carpeta del proyecto con VsCode o el IDE que prefieras
    y desde su propia terminal hacer uso de pip, por ejemplo pip install pillow==10.3.0