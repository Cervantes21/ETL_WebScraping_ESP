# ETL_WebScraping_ESP
Cursos y proyectos para aprender, o mejorar sobre ETL y WebScraping con Python como lenguaje y otras herramientas.


# Sigue los siguientes pasos para la instalación:

## **Paso 1:** 

Primero tienes que clonar este repositorio con el comando:

```
git clone https://github.com/Cervantes21/ETL_WebScraping_ESP.git
```

## **Paso 2:**

Descargaremos y crearemos la carpeta para poder importar nuestra base de datos:

Primero vamos a darle los permisos al Script:

```
chmod +x download_data.sh
```

Posteriormente ejecutamos con:

```
./download_data.sh
```
Cuando ejecutemos el programa, nos notificará cuando la carpeta sea creada y el archivo descargado.

---

## **PASO 3: MUY IMPORTANTE**
Debemos de crear una variable de entorno para guardar nuestra contraseña:

Así podemos abrir un editor de texto, yo usaré para este ejemplo **vim**

```
vim .env
```
Recordemos que para salir de **vim** Damos **ESC** seguido de teclear "**:wq**"

En este ejemplo sólo se debe de sustituir "mypassword" por tu contraseña, las comillas son inecesarias:
```
POSTGRES_PASSWORD=mypassword
```
---

## **Paso 4:**
Ahora también debemos de crear y activar nuestro entorno virtual:

```bash
python -m venv venv
```

Para activar:
```bash
source venv/bin/activate
```
Este comando varia según el OS

Windows:
```cmd
python3 -m virtualenv venv
```

Para activar el ambiente:
```cmd
.\venv\Scripts\activate
```
---

## **Paso 4:**

Ahora debemos de alzar nuestra imagen con docker-compose:

```
docker-compose up -d
```
Este comando desplegará nuestra imagen además nos importará nuestro Script de SQL a nuestra base de datos

Ahora verificamos:
```
docker ps
```

## **Paso 5:**

Podemos ingresar ahora a nuestra base de datos:

```
docker exec -it postgres psql -U postgres

```

Y de ahí continuamos a hacer nuestras consultas en SQL:

Ejemplo:

```
\dt
```

### Algunos comandos de Postgres son:

- \l o \list: Muestra la lista de bases de datos disponibles.
- \c o \connect: Conecta a una base de datos específica.
- \dt o \d: Muestra la lista de tablas en la base de datos actual.
- \d <table_name>: Muestra la estructura de una tabla específica.
- \du o \du+: Muestra la lista de roles de usuarios y sus atributos.
- \q: Sale de la interfaz de línea de comandos de PostgreSQL.


