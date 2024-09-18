#!/bin/bash

read -p "Introduzca un número: " num1
read -p "Introduzca otro número: " num2

suma=$(echo "scale=2; $num1 + $num2" | bc)
media=$(echo "scale=2; $suma / 2" | bc)

echo "La media es $media"
