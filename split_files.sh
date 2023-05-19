#!/bin/bash

# Ruta del archivo SQL original
archivo_original="./source/postgres_public_trades.sql"

# Verificar si el archivo original existe
if [ ! -f "$archivo_original" ]; then
  echo "El archivo \"$archivo_original\" no existe."
  exit 1
fi

# Crear carpeta para los archivos divididos
carpeta_destino="./source/dividido"
mkdir -p "$carpeta_destino"

# Nombre base para los archivos divididos
nombre_base="trades_part"

# Dividir el archivo original en archivos separados
csplit --quiet --prefix="$carpeta_destino/$nombre_base" "$archivo_original" "/^INSERT/" "{*}"

if [ $? -eq 0 ]; then
  echo "El archivo \"$archivo_original\" se dividió exitosamente."
else
  echo "Error al dividir el archivo \"$archivo_original\"."
  exit 1
fi

# Agregar BEGIN y COMMIT a cada archivo dividido
archivos_divididos=("$carpeta_destino/$nombre_base"*)
for archivo in "${archivos_divididos[@]}"; do
  sed -i '1s/^/BEGIN;\n/' "$archivo"
  echo -e "\nCOMMIT;" >> "$archivo"
done

echo "Se han creado los archivos divididos en la carpeta \"$carpeta_destino\"."

# Otorgamos permisos:

chmod +x "$0"
