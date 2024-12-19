#!/bin/bash

function tipo_red() {
 read -p "Introduzca una interfaz: " interfaz

 echo ""
 echo "Generando informe..."
 echo ""

 red=$(ip addr show $interfaz | awk '/inet /{print $2}')
 broadcast=$(ip addr show $interfaz | awk '/inet /{print $4}')
 mascara=$(ip addr show $interfaz | awk '/inet /{print $2}' | cut -d'/' -f2)

 nombre_red=$(ipcalc $red | awk '/Network/{print $2}')

 echo ""                                           >> Informe_ip_libres_$interfaz.txt
 echo "------------------------------------------" >> Informe_ip_libres_$interfaz.txt
 echo "          Información de la red         "   >> Informe_ip_libres_$interfaz.txt
 echo ""                                           >> Informe_ip_libres_$interfaz.txt
 echo "Tipo de red (rango CIDR): $red"             >> Informe_ip_libres_$interfaz.txt
 echo "Nombre de la red: $nombre_red"              >> Informe_ip_libres_$interfaz.txt
 echo "Broadcast: $broadcast"                      >> Informe_ip_libres_$interfaz.txt
 echo "Máscara de subred: /$mascara"               >> Informe_ip_libres_$interfaz.txt
 echo "------------------------------------------" >> Informe_ip_libres_$interfaz.txt
 echo ""                                           >> Informe_ip_libres_$interfaz.txt

 ip_base=$(echo "$red" | egrep '([0-9]{1,3}\.){3}[0-9]{1,3}' | cut -d '.' -f1-3 | awk -F '.' '{print $1 "." $2 "." $3 "."}')

 for (( i=1; i<=254; i++ )); do
  ip="$ip_base$i"
  ping -c 4 $ip &>/dev/null
   if [[ $? -eq 0 ]]; then
     echo "La IP $ip está ocupada." >> Informe_ip_libres_$interfaz.txt
    else
     echo "La IP $ip está libre." >> Informe_ip_libres_$interfaz.txt
   fi
 done

 echo "Informe generado."
 echo ""
}

tipo_red
