#!/bin/bash

contador=1

while [[ $contador -le 1000 ]]; do
  suma=$((contador + suma))
  ((contador++))
done

echo "Suma igual a $suma"
