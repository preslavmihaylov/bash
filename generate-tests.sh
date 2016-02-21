#!/bin/bash

for i in {10..19}; do
	awk -F " - |-" -v var="$i" 'NR==var{print $2}' $1 \
	> test.0$i.out.txt
done;

