# Importamos nuestras librerías:

from dotenv import load_dotenv
import os
import psycopg2

# Cargar las variables de entorno desde el archivo .env
load_dotenv()

# Obtener el valor de la variable de entorno para la c./source/postgres_public_traders.sqlpassword = os.environ.get('DB_PASSWORD')

# Establecer los detalles de conexión a la base de datos
host = 'localhost'
port = 5432
database = 'postgres'
user = 'postgres'

# Leer el contenido del archivo SQL
with open('./source/postgres_public_traders.sql', 'r') as file:
    sql_script = file.read()

# Conectar a la base de datos
conn = psycopg2.connect(
    host=host,
    port=port,
    database=database,
    user=user,
    password=password
)

# Crear un cursor para ejecutar las consultas
cursor = conn.cursor()

# Ejecutar el script SQL
cursor.execute(sql_script)

# Confirmar los cambios en la base de datos
conn.commit()

# Cerrar la conexión
cursor.close()
conn.close()

