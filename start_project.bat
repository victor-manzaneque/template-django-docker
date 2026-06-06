@echo off
cls
echo ====================================================
echo   ASISTENTE DE INICIALIZACION DE PROYECTO DJANGO
echo ====================================================
echo.

:: 1. Comprobar si el proyecto ya existe
if exist manage.py (
    echo [INFO] Proyecto Django ya detectado en esta carpeta.
    goto LEVANTAR
)

:: 2. Solicitar el nombre del proyecto al usuario
:PEDIR_NOMBRE
set /p PROJECT_NAME="Introduce el nombre para tu nuevo proyecto Django: "

if "%PROJECT_NAME%"=="" (
    echo [ERROR] El nombre del proyecto no puede estar vacio.
    echo.
    goto PEDIR_NOMBRE
)

:: 3. Crear el proyecto con Docker
echo.
echo [INFO] Creando el proyecto "%PROJECT_NAME%" con Docker...
docker compose run --rm web django-admin startproject %PROJECT_NAME% .

if %errorlevel% neq 0 (
    echo [ERROR] Hubo un problema al crear el proyecto. Asegurate de que Docker esta corriendo.
    pause
    exit /b
)

echo [OK] Proyecto "%PROJECT_NAME%" creado exitosamente.
echo.

:: 4. Levantar los contenedores
:LEVANTAR
echo [INFO] Iniciando el contenedor de Docker...
docker compose up

pause