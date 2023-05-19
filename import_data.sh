#!/bin/bash

# Directorio donde se encuentran los archivos SQL
sql_directory="/docker-entrypoint-initdb.d"

# Bucle para importar cada archivo SQL
for sql_file in $sql_directory/*.sql; do
  echo "Importando archivo: $sql_file"
  psql -U postgres -f "$sql_file"
done

# Permisos de ejecución:

chmod +x "$0"
