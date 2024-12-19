#!/bin/bash

read -p "Introduzca un directorio a comprimir: " directorio

fecha=$(date +%Y-%m-%d)

nombre_directorio=$(basename "$directorio")

tar -zcvf "${fecha}_${nombre_directorio}.tar.gz" "$directorio"
