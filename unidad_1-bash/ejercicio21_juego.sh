#!/bin/bash

read -p "Introduzca un número: " numero

contador=1

acierto=24
numero_minimo=1
numero_maximo=100

for (( ; ; )); do
   if [[ $numero -eq 0 ]]; then
     echo "Se ha rendido. El número a adivinar es 24."
     exit
   elif [[ $numero -eq $acierto ]]; then
     echo ""
     echo "¡¡Enhorabuena, ha acertado el número!!"
     echo ""
     exit
   elif [[ $numero -lt $numero_minimo || $numero -gt $numero_maximo ]]; then
     echo "El número introducido debe estar comprendido entre 1 y 100."
     exit
   elif [[ $numero -gt $acierto ]]; then
     echo "El número introducido es mayor al acertado."
     exit
   else
     echo "El número introducido es menor al acertado."
     exit
  fi
done
