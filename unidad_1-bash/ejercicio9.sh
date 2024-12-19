#!/bin/bash

read -p "Introduzca un número: " num1

read -p "Introduzca otro número: " num2

echo "Escoja una de las siguientes opciones: "
echo "1) Suma"
echo "2) Resta"
echo "3) Multiplicación"
echo "4) División"
echo -n "Opción introducida: "

read opcion

case $opcion in
	1)
	  suma=$(echo "scale=2; $num1 + $num2" | bc)
          echo $suma
          ;;
        2)
          resta=$(echo "scale=2; $num1 - $num2" | bc)
          echo $resta
          ;;
        3)
          multiplicacion=$(echo "scale=2; $num1 * $num2" | bc)
          echo $multiplicacion
          ;;
        4)
          division=$(echo "scale=2; $num1 / $num2" | bc)
          echo $division
          ;;
        *)
          echo "La opción introducida es incorrecta."
esac
