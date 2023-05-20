#!/bin/bash

# Ruta y nombre del archivo SQL original
archivo_original="./source/postgres_public_trades.sql"

# Número máximo de líneas por archivo
lines_per_file=30000

# Prefijo para los archivos de salida
output_prefix="trades"

# Directorio de salida
carpeta_destino="./source/dividido"

# Crear el directorio de salida si no existe
mkdir -p "$carpeta_destino"

# Contador para el número de archivos generados
file_counter=1

# Contador para el número de líneas en el archivo actual
line_counter=0

# Nombre del archivo de salida actual
output_file="${output_prefix}_$(printf "%03d" "$file_counter").sql"

# Leer el archivo SQL de entrada línea por línea
while IFS= read -r line
do
  # Verificar si se ha alcanzado el límite de líneas por archivo
  if [[ $line_counter -eq $lines_per_file ]]; then
    # Agregar ;) para cerrar la sentencia al archivo actual
    echo -e ");\n" >> "$carpeta_destino/$output_file"

    # Incrementar el contador de archivos
    ((file_counter++))

    # Restablecer el contador de líneas
    line_counter=0

    # Nombre del archivo de salida actual
    output_file="${output_prefix}_$(printf "%03d" "$file_counter").sql"
    
    # Agregar la sentencia INSERT INTO al nuevo archivo
    echo -e "INSERT INTO public.trades (country_code, year, comm_code, flow, trade_usd, kg, quantity, quantity_name)\nVALUES\n" > "$carpeta_destino/$output_file"
  fi

  # Agregar la línea al archivo de salida actual
  echo "$line" >> "$carpeta_destino/$output_file"

  # Incrementar el contador de líneas
  ((line_counter++))

done < "$archivo_original"

# Agrega ;) para cerrar la sentencia del último archivo
echo -e ");\n" >> "$carpeta_destino/$output_file"

echo "Se han creado $file_counter archivos en el directorio $carpeta_destino."

# Dar permisos de ejecución al script
chmod +x "$0"
