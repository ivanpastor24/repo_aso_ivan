#!/bin/bash

function uso() {
  echo "Error. La sintaxis correcta es: ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
}

if [[ $# -lt 4 ]]; then
  uso
  exit
fi

accion=$1
nombre=$2
apellido1=$3
apellido2=$4
grupo=$5

identificador="alu${apellido1:0:2}${apellido2:0:2}${nombre:0:1}"

if [[ "$accion" == "alta" ]]; then
    if [[ -z "$grupo" ]]; then
        grupo=$identificador
        if ! grep -q "^$grupo:" /etc/group; then
            sudo groupadd "$grupo"
            echo "Grupo '$grupo' creado."
        fi
    fi

    if ! id "$identificador" &>/dev/null; then
        sudo useradd -m -g "$grupo" -c "$nombre $apellido1 $apellido2" "$identificador"
        echo "Usuario '$identificador' creado y asignado al grupo '$grupo'."
    else
        echo "El usuario '$identificador' ya existe."
    fi

elif [[ "$accion" == "baja" ]]; then
     if id "$identificador" &>/dev/null; then
         sudo userdel -r "$identificador"
         echo "Usuario '$identificador' eliminado."
     else
         echo "El usuario '$identificador' no existe."
     fi
else
    uso
    exit
fi
