#!/bin/bash

contador=1

until [[ $contador -gt 1000 ]]; do
  suma=$((contador + suma))
  ((contador++))
done

echo "Suma igual a $suma"
