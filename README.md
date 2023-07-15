# **ETL_WebScraping_ESP**
Cursos y proyectos para aprender, o mejorar sobre ETL y WebScraping con Python como lenguaje y otras herramientas.

---
# **¿No tienes Docker, o tienes dudas sobre PostgreSQL?**

Te dejo estos link con información adicional:

- [Este repositorio](https://github.com/ddasilva64/ETLPPT23001esp/blob/master/extraccion-de-datos.md) contiene Paso a paso la instalación de cada Software, además realiza la explicación para distintos tipos de Sistemas Operativos

- [¡¡Tengo Windows!!](https://www.youtube.com/watch?v=ZO4KWQfUBBc&pp=ygUKZG9ja2VyIHdzbA%3D%3D) Bueno, creo que te ha tocado un poquito de suerte, ya que en este vídeo lo explica a detalle la descarga de un subsistema de linux **(WLS)**, su instalación y configuración así mismo de **Docker**. 

---

# Crear nuestra base de datos en PostgreSQL:

Vamos a importar nuestra base de datos, para crearla a traves de un contendor en docker, y poder extrar nuestros datos y poder hacer nuestras practicas. Para ello, sólo necesitamos seguir unos sencillos pasos.

Lo que debemos saber:
- Con un Script de Bash llamdo **download_data.sh**, vamos a descargar nuestros datos, pesa cerca de 556 MB. Y contiene **+6 millones de líneas**.
- Como es muy pasado, procederemos a dividirlo en pequeños fragmentos y agregar correctamente las sentencias INSERT INTO y cerrarlas, por lo tanto usaremos un Script de Bash, llamado **split_data.sh** para automatizar este proceso.

- Ya creada nuestra base de datos, procederemos a la ingesta de los datos, y usaremos nuestro Script **import_data.sh** para realizar este proceso de manera automatizada.

SIGUE LOS SIGUIENTES PASOS:
## **PASO 1: Clonar el Repositorio** 

Primero tienes que clonar este repositorio con el comando:

```
git clone https://github.com/Cervantes21/ETL_WebScraping_ESP.git
```

## **Paso 2: Descargar datos**

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

## **PASO 3: Dividir el archivo original**

Vamos a dividir nuestro archivo y agregaremos las sentencias INSERT INTO y cerraremos la sentencia.

Le damos los permisos necesarios:

```
chmod +x split_data.sh
```

Ejecutamos:

```
./split_data.sh
```

---
## **PASO 4: MUY IMPORTANTE**
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

## **PASO 5: Activar Entorno virtual**
Ahora también debemos de crear y activar nuestro entorno virtual:

```bash
python -m venv venv
```

Para activar:
```bash
source venv/bin/activate
```

---

## **PASO 6: Crear la Base de datos con Docker**

Ahora debemos de alzar nuestra imagen con **docker-compose**:

```
docker-compose up -d
```
Lo que hará, será importarnos nuestros archivos ya divididos para poder importar la base de datos

Ahora verificamos:
```
docker ps
```

## **PASO 7: Importar nuestra base de datos**

Debemos primero ejecutar, una terminal en bash para poder usar nuestro Script **import_data.sh**:

```
docker exec -it postgres bash

```
Eso nos llevará a la consola de bash de nuestro contenedor de **docker**

Usaremos el comando para listar todo lo que tenemos:
```bash
ls
```
Debería de estar nuestro archivo **import_data.sh**

Vamos a darle permisos:
```bash
chmod +x import_data.sh
```

Corremos el Script:
```bash
./import_data.sh
```
Terminando este proceso ahora pasamos al siguiente paso.

## **PASO 8: Ingresar a la base de datos**

Estando en nuestro contenedor y ya ejecutado el **PASO 7** ingresaremos a la base de datos:

```
psql -U postgres
```

Y de ahí continuamos a hacer nuestras consultas en SQL:

Ejemplo:

```
\dt
```

Si realizaste todos los pasos correctos y estás dentro de la base de datos
Una consulta que podrías realizar sería la siguiente:

```sql
SELECT * FROM trades;
```
### Algunos comandos de Postgres son:

- \l o \list: Muestra la lista de bases de datos disponibles.
- \c o \connect: Conecta a una base de datos específica.
- \dt o \d: Muestra la lista de tablas en la base de datos actual.
- \d <table_name>: Muestra la estructura de una tabla específica.
- \du o \du+: Muestra la lista de roles de usuarios y sus atributos.
- \q: Sale de la interfaz de línea de comandos de PostgreSQL.

---

# RECUERDA: 
Recuerda verificar sí tu contenedor sigue corriendo con el comando
```
docker ps
```

Para detenerlo:
```
docker stop postgres
```

Para volver a iniciarlo:
```
docker start postgres
```

## Sí ya está creada la Base de datos, puedes volver a acceder:

Una vez iniciado el contenedor:
```
docker exec -it postgres psql -U postgres
```

