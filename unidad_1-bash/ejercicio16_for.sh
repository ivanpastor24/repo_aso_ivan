#!/bin/bash

for i in `seq 1 1000`; do
  suma=$((i + suma))
done

echo "Suma igual a $suma"
