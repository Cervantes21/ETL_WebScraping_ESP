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

# Dar permisos de ejecución al script
chmod +x "$0"

