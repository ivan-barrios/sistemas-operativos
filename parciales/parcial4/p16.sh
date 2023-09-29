#!/bin/bash


if [ $# -lt 1 ]; then
	echo "parametros mal"
	exit 1
fi


if [ ! -d $1 ]; then
	echo "El directorio $1 no existe"
	exit 2	
fi

for i in ${@:2}; do
	if [ -f $i ]; then
		if [ -x $i ]; then
			echo "Posee permiso de ejecucion en "$i""
		else
			echo "no posee permiso de ejecucion en "$i""
		fi
	elif [ -d $i ]; then
		if [ -r $i ]; then
			echo "posee permiso de lectura en "$i""
		else
			echo "no posee permiso de lectura en "$i""
		fi
	fi
done
