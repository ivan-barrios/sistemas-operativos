#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Cantidad de param incorrecta"
	exit 1
fi

while true; do
	if who | grep $1; then
		echo "El usuario $1 es usuario del sistema"
		echo "$1 $(date)" >> /home/ivan-barrios/repos/sistemas-operativos/parciales/parcial4/usuarios.log
		break
	fi
	sleep 5
done
