#!/bin/bash

for i in {1..5}; do
  for (( a=1; a<=i; a++ )); do
   echo -n "$i"
  done
 echo ""
done
