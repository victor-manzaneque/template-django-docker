# 🐳 Django + Docker Development Template (Turnkey Solution)

> 🌍 **Language Versions:** [Español](README.md) | [English](README.en.md)

This project is an automated template for deploying **Django** development environments using **Docker**[cite: 2]. It is designed under the principle of absolute portability, allowing you to switch work environments instantly without worrying about Python installation, virtual environments, or dependency incompatibilities.

---

## 🚀 Prerequisites

Before getting started, make sure you have the following installed and running on your system:
* [Docker Desktop](https://www.docker.com/products/docker-desktop/)

---

## 📦 Step-by-Step Usage Guide

Follow these steps to initialize your own project from scratch using this template:

### Step 1: Create your new project folder
To avoid container naming conflicts in Docker and keep your projects organized, **do not work inside the template folder**.
1. Create a new folder on your computer with the name you want for your application (for example: `mi_app_biblioteca`).
2. Copy the following files from the template and paste them into the folder you just created:
   * `docker-compose.yml`
   * `Dockerfile`
   * `requirements.txt`
   * `start_project.bat`

> 💡 *By doing it this way, Docker Compose will automatically name the container after your folder (`mi_app_biblioteca`), keeping it completely isolated from other projects.*

---

### Step 2: Initialize the project using the Assistant
Double-click the **`start_project.bat`** file (on Windows systems).

**How does the script behave?**
* **First-time execution:** The script will detect that the Django project structure does not exist yet[cite: 2]. It will interactively prompt you in the console to **enter the Django project name** (e.g., `my_digital_books` or `web_tienda_deportes`)[cite: 2]. Docker will generate the clean files into your local directory and immediately spin up the server.
* **Subsequent executions:** The script will detect that the project is already created, skip the setup questions, and directly run your containers using `docker compose up`[cite: 2]. This process is completely automatic.

The web server will be immediately available at: **`http://localhost:8000`**

---

### Step 3: Configure the Database and the Admin Panel
Once you see the Django rocket page in your browser, you must prepare the local database (SQLite3) and create your control panel access account].

Before running the commands, check **Docker Desktop** to ensure your project's container is marked in green (`Running`)[cite: 2]. With the container active, open the docker terminal (bottom right corner):

1. **Apply Initial Migrations:**
   Creates the local `db.sqlite3` file and generates the required database tables for the authentication system, enter this command in the terminal:

   `docker compose exec web python manage.py migrate`

2. **Create the Admin Superuser:**
    Launches the interactive assistant to set up your access credentials, enter this command in the terminal:

    `docker compose exec web python manage.py createsuperuser`

    Enter your username and password (characters will not be displayed while typing for security reasons; you can skip the email address).

You can now manage your application by visiting: **`http://localhost:8000/admin`**


💾 Development Notes
    Real-time synchronization: Thanks to the shared volume (.:/code), any changes you make to your code from your IDE (such as VS Code) will be instantly reflected inside Docker, and Django will restart the server automatically. Ultimately, your app files are hosted inside your local machine and not within the docker container, making the container completely disposable. The database is fully persistent; if you delete the container, IT DOES NOT MATTER! Your files will remain exactly where you left them. If you want to spin up the container again, simply execute the start_project.bat file.

    Included libraries: The template comes pre-configured with Django, Pillow (image management), and Django REST Framework (in case you need to develop APIs). You can add more libraries by editing the requirements.txt file and rebuilding the container. If you want to install additional libraries, you just need Docker and the container to be running, open the project folder with VS Code or your preferred IDE, and make use of pip directly from its integrated terminal, for example: pip install pillow==10.3.0.