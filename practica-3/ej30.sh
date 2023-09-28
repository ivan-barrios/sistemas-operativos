#!/bin/bash

actual_dir=$(pwd)
home_dir=$HOME
bin_dir=$home/bin


mkdir -p "$bin_dir"

cant=0

for archivo in "$actual_dir"/*; do
	if [ -x "$archivo" ] && [ -f $archivo ]; then
		mv "$archivo" "$bin_dir"
		echo "Moviendo $archivo a $bin_dir"
		((cant++))
	fi
done

if [ "$cant" -eq 0 ]; then
	echo "No se movio ningun archivo ejecutable"
else
	echo "Se movieron $cant archivos ejecutables"
fi
