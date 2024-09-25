#!/bin/bash

if [[ $# -ne 1 ]]; then
   echo "Error. Uso: $0 <nombre-completo-directorio>"
   exit
fi

directorio=$1

if [[ ! -d $directorio ]]; then
   echo "Error: el directorio $directorio no es válido o no existe."
   exit
fi

contador=0

for entrada in "$directorio"/*; do

    contador=$((contador + 1))

   if [[ -d $entrada ]]; then
       echo "La ruta $entrada es un directorio."
     elif [[ -f $entrada ]]; then
       echo "La ruta $entrada es un fichero."
     elif [[ -L $entrada ]]; then
       echo "La ruta $entrada es un enlace simbólico."
     elif [[ -b $entrada ]]; then
       echo "La ruta $entrada es un archivo especial de bloque."
     elif [[ -c $entrada ]]; then
       echo "La ruta $entrada es un archivo especial de carácter."
     else
       echo "La ruta $entrada es otro tipo de fichero."
   fi
done

echo ""
echo "El número total de entradas procesadas es: $contador"
echo ""
