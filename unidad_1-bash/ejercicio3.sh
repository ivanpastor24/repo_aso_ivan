#!/bin/bash

ls /etc > lista.txt

cat lista.txt & wc -l -w lista.txt
