#!/bin/bash

if [ $# -lt 2 ]; then
	echo "Pasame bien los parametros"
	exit 1
fi

if [ ! -d $1 ]; then
	echo "El primer parametro no es un directorio"
	exit 2
fi

for param in "${@:2}"; do
	if [ -f "$param" ]; then
		#veo si tengo permisos de ejecucion
		if [ -x "$param" ]; then
			echo "Tenes permisos de ejecucion sobre "$param""
		else
			echo "No tenes permisos de ejecucion sobre "$param""
		fi
	elif [ -d "$param" ]; then
		#veo si tengo permiso de escritura
		if [ -w "$param" ]; then
			echo "Tenes permisos de escritura sobre "$param""
		else
			echo "No tenes permisos de escritura sobre "$param""
		fi
	else
		echo "El archivo "$param" no existe"
	fi
done
