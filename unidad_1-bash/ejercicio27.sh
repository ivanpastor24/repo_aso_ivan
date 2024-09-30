#!/bin/bash

function existe() {
 if [[ -f $1 ]]; then
   chmod u+x $1
  else
   echo "El fichero introducido no existe o no se ha encontrado."
 fi
}

existe $1
