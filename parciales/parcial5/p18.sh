#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Se debe pasar al menos un usuario como parametro"
	exit 1
fi

esta_logueado(){
	if [ $# -ne 1 ]; then
		echo "me pasaste mal los parametros en esta_logueado"
		return 1
	fi

	if [ $(who | cut -d" " -f1) = $1 ]; then
		return 0 #true
	else 
		return 2 #false
	fi	
}

cant_procesos(){
	if [ $# -ne 1 ]; then
		echo "Me estas pasando mal los parametros"
		return 1
	fi

	cant=$(ps -u $1 | wc -l)
	echo "$cant"
}


uso_de_procesos(){
	if [ $# -ne 1 ]; then
		echo "parametros mal en uso_de_procesos"
		return 2
	fi

	if [ $(cant_procesos $1) -ge 100 ]; then
		return 0
	else
	       	return 1
	fi
}



echo "Fecha de revisión: $(date)" >> ./reporte.txt

for usr in $*; do
	uso_de_procesos $usr
	if [ $? -eq 0 ]; then
		echo "USUARIO: $usr" >> ./reporte.txt
	fi
done












