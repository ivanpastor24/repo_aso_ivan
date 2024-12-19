#!/bin/bash

read -p "Introduzca un número: " num1

read -p "Introduzca otro número: " num2

if [[ num1 -gt num2 ]]; then
 echo "El número 1 es mayor que el número 2"
else
 echo "El número 2 es mayor que el número 1"
fi
