#!/bin/bash

numero=$1

for (( i=0; i<=10; i++ )); do
  resultado=$((numero*i))
  echo "$numero x $i = $resultado"
done
