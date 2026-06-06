FROM python:3.11-slim

# Evita archivos .pyc y permite ver logs en tiempo real
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /code

# Instalamos dependencias básicas de Python
RUN pip install --no-cache-dir --upgrade pip
COPY requirements.txt /code/
RUN pip install --no-cache-dir -r requirements.txt

# El contenedor documenta que usa el puerto 8000
EXPOSE 8000