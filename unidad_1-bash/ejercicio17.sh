#!/bin/bash

numero=1

while [[ $numero -ne 0 ]]; do
  read -p "Introduzca un número (0 para salir): " numero
  suma=$((numero + suma))
done

echo "Suma igual a $suma"
