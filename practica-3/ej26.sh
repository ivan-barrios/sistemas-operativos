#!/bin/bash
if [ $# -lt 1 ]; then
	echo "Debe ingresar al menos 1 parametro";
	exit 1;
fi

arreglo=($@)
noexisten=0

echo "${arreglo[@]}"

for ((i=0; i<${#arreglo[*]}; i++)) do
	if [ ! -e ${arreglo[i]} ]; then
		((noexisten++))
	elif [ $((i % 2)) -ne 0 ]; then
		if [ -f ${arreglo[i]} ]; then
			echo "${arreglo[i]} es un archivo"
		elif [ -d ${arreglo[i]} ]; then
			echo "${arreglo[i]} es un directorio"
		fi
	fi
done

echo "Hay $noexisten rutas que no existen"


