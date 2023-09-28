#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Pasa como parametro el directorio"
	exit 1
fi

if [ ! -d $1 ]; then
	echo "El directorio $1 no existe"
	exit 4
fi

lectura=0
escritura=0
ejecucion=0
for i in $1/* ; do
	if [ -f "$i" ]; then
		if [ -r "$i" ]; then
			((lectura++));
		fi
		if [ -w "$i" ]; then
			((escritura++));
		fi
		if [ -x "$i" ]; then
			((ejecucion++))
			echo "El archivo $i tiene permisos de execution"
		fi
	fi
done

echo "Hay $lectura archivos con permiso de lectura y $escritura archivos de escritura, $ejecucion de ejecucion"
