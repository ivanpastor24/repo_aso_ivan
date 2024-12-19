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

contador_ficheros=0
contador_subdirectorios=0

for entrada in "$directorio"/*; do
   if [[ -d $entrada ]]; then
      contador_subdirectorios=$((contador_subdirectorios + 1))
     elif [[ -f $entrada ]]; then
      contador_ficheros=$((contador_ficheros +1))
   fi
done

echo ""
echo "Estadísticas en el directorio: $directorio"
echo "Número de ficheros: $contador_ficheros"
echo "Número de subdirectorios: $contador_subdirectorios"
echo ""
