#!/bin/bash

if [ $# -lt 2 ]; then
	echo "Debe ingresar por lo menos dos parametros"
	exit 1
fi

fecha=$1
log_Dir=/var/log/nginx
log_File=$log_Dir/access.$fecha.log

if [ ! -f "$log_File" ]; then
	echo "No se pudo encontrar un archivo para esa fecha" >&2
	exit 2
fi

#Debe informar IP : Cantidad de accesos desde esa IP

#En lugar de este for se podia poner IPs=("${@:2}") y hacer el for con esa var

for ((i=2; i<$#; i++)); do
	count=$(grep -c "$i" "$log_File")
	echo "$i : $count"
done

exit 0
