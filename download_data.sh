#!/bin/bash

# Ruta de la carpeta de destino
carpeta_destino="./source"

# Verificar si la carpeta ya existe
if [ -d "$carpeta_destino" ]; then
  echo "La carpeta \"$carpeta_destino\" ya existe."
else
  # Crear la carpeta de destino
  mkdir -p "$carpeta_destino"
  if [ $? -eq 0 ]; then
    echo "La carpeta \"$carpeta_destino\" se creó exitosamente."
  else
    echo "Error al crear la carpeta \"$carpeta_destino\"."
    exit 1
  fi
fi

# Ruta y nombre del archivo de destino
archivo_destino="$carpeta_destino/postgres_public_trades.sql"

# Verificar si el archivo ya existe
if [ -f "$archivo_destino" ]; then
  echo "El archivo \"$archivo_destino\" ya existe."
else
  # Descargar el archivo
  wget -O "$archivo_destino" "https://drive.google.com/u/0/uc?id=19U7l0kp3mEh8SYYG6BjoDp0kVPYWDsqI&export=download&confirm=t&uuid=6c9e00cb-f471-43b2-97af-de8c286372e5&at=AKKF8vxLsUuxKRWUEFTYkloo0AMf:1684317143239" -q
  if [ $? -eq 0 ]; then
    echo "El archivo \"$archivo_destino\" se descargó exitosamente."
  else
    echo "Error al descargar el archivo \"$archivo_destino\"."
    exit 1
  fi
fi

# Descargar archivo JSON
json_destino="$carpeta_destino/country_data.json"
wget -O "$json_destino" "https://static.platzi.com/media/public/uploads/country_data_1a652f68-ca5a-4d02-94f9-9aa0d4edd6ac.json" -q
if [ $? -eq 0 ]; then
  echo "El archivo JSON se descargó exitosamente."
else
  echo "Error al descargar el archivo JSON."
  exit 1
fi

# Descargar archivo CSV
csv_destino="$carpeta_destino/hs_codes.csv"
wget -O "$csv_destino" "https://static.platzi.com/media/public/uploads/hs_codes_67d0ca02-86f0-4829-8568-389ab67a38e5.csv" -q
if [ $? -eq 0 ]; then
  echo "El archivo CSV se descargó exitosamente."
else
  echo "Error al descargar el archivo CSV."
  exit 1
fi

# Dar permisos de ejecución al script
chmod +x "$0"

