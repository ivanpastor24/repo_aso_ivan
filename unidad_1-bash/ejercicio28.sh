#!/bin/bash

function tipo_red() {
 read -p "Introduzca una interfaz: " interfaz

 red=$(ip addr show $interfaz | awk '/inet /{print $2}')

 ip_base=$(echo "$red" | egrep '([0-9]{1,3}\.){3}[0-9]{1,3}' | cut -d '.' -f1-3 | awk -F '.' '{print $1 "." $2 "." $3 "."}')

 for (( i=1; i<=254; i++ )); do
  ip="$ip_base$i"
  ping -c 4 $ip &>/dev/null
  if [[ $? -eq 0 ]]; then
    echo "La IP $ip está ocupada."
   else
    echo "La IP $ip está libre."
  fi
 done
}

tipo_red
