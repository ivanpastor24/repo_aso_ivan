#!/bin/bash

read -p "Introduzca un número: " numero

if [ $((numero % 2)) -eq 0 ]; then
  echo "El número introducido es par."
 else
  echo "El número introducido es impar."
fi
