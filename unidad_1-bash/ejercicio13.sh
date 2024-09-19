#!/bin/bash

archivo="lista.txt"

menu() {
  echo "_________________________________________"
  echo "AGENDA"
  echo "1. Añadir un registro"
  echo "2. Buscar entradas"
  echo "3. Visualizar todo el archivo"
  echo "4. Ordenar los registros alfabéticamente"
  echo "5. Borrar el archivo"
  echo "6. Salir del programa"
  echo "_________________________________________"
}

introducir_registro() {

  nombre="$1"
  direccion="$2"
  telefono="$3"

  echo "Introduzca el nombre: "
  read nombre
  echo "Introduzca la dirección: "
  read direccion
  echo "Introduzca el teléfono: "
  read telefono

  echo "\"$nombre\" \"$direccion\" \"$telefono\"" >> $archivo
  echo ""
  echo "Registro añadido correctamente."
}

buscar_entradas() {
  echo "Buscar por nombre, dirección y teléfono: "
  read criterio
  echo "Resultados de la búsqueda: "
  grep -i $criterio $archivo || echo "No se encontró ninguna coincidencia con el dato introducido."
}

visualizar_archivo() {
  if [[ -f $archivo ]]; then
    echo "Listado del archivo: "
    cat $archivo
   else
    echo "No existe el archivo introducido."
  fi
}

ordenar_registros() {
  if [[ -f $archivo ]]; then
    sort $archivo -o $archivo
    echo "Registros ordenados alfabéticamente."
   else
    echo "No existe el archivo introducido."
  fi
}

borrar_archivo() {
  if [[ -f $archivo ]]; then
    rm $archivo
    echo "Archivo borrado."
   else
    echo "No existe el archivo introducido."
  fi
}

while true; do
  menu
  echo "Escoja una de las siguientes opciones: "
  read opcion

  case $opcion in
    1)
      introducir_registro
      ;;
    2)
      buscar_entradas
      ;;
    3)
      visualizar_archivo
      ;;
    4)
      ordenar_registros
      ;;
    5)
      borrar_archivo
      ;;
    6)
      echo "Has salido del programa."
      exit
      ;;
    *)
      echo ""
      echo "Opción no válida. Introduzca un número entre el 1 y 6."
      ;;
  esac
 echo ""
done
