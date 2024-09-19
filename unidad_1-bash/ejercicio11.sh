#!/bin/bash

if [[ "$#" -ne 2 ]]; then
 echo "Error: No se han introducido correctamente los dos parámetros."
fi

origen="$1"
destino="$2"

if [[ ! -f "$origen" ]]; then
 echo "Error: El archivo introducido no existe, o bien, no se trata de un fichero ordinario."
fi

if [[ -e "$destino" ]]; then
 echo "Error: El archivo introducido ya existe en la ubicación de destino."
fi

cp "$origen" "$destino"
