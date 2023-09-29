#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Cantidad de parametros incorrecta"
	exit 1
fi

#Nombres de todos los usuarios del sistema que tengan un patron, recibido como parametro

array=($(grep $1 /etc/passwd | cut -d: -f1))

options="Listar Eliminar Contar Salir"

select option in $options; do
	case $option in
		"Listar")
			for i in ${array[*]}; do
				echo "User: $i"
			done
		;;

		"Eliminar")
			for ((i=0; i<${#array[*]}; i++)); do
				echo "$i) ${array[$i]}"
			done
			echo "Which element do you want to delete?"
			read pos
			if [ $pos -ge ${#array[*]} ] || [ $pos -lt 0 ]; then
				echo "Invalid element"
				break
			else
			       unset array[$pos]
			       echo "Successfully deleted the element $pos"	       
			fi
		;;
		"Contar")
			echo "La cantidad es: ${#array[*]}"
		;;
		"Salir")
			exit 0
		;;
	esac
done
