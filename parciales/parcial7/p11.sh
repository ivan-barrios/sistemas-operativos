#!/bin/bash

array=()

insert(){
	if [ $# -ne 1 ]; then
		echo "no param insert"
		return 1
	fi

	array=(${array[*]} $1)
	echo "elemento insertado exitosamente"
}

rellenar(){
	if [ $# -ne 1 ]; then 
		echo no param rellenar
		return 1
	fi

	for ((i=0; i<$1; i++)); do
		read text
		insert $text
	done
}



seleccion(){
	if [ $# -ne 1 ]; then
		echo "no param select"
		return 1
	fi

	if [ "$1" = "*" ]; then
		echo "${array[*]}"
	else
		encontre=0
		for ((i=0; i<${#array[*]}; i++)); do
			if [ "${array[$i]}" = "$1" ]; then
				echo "existe $1"
				((encontre++))
				break
			fi
		done
		if [ $encontre -ne 1 ]; then
			echo "elemento no encontrado"
		fi
	fi
}


delete(){
	if [ $# -ne 1 ]; then
		echo "no param delete"
		return 1
	fi

	if [ $1 = "*" ]; then
		array=()
	else
		encontre=0
		for ((i=0; i<${#array[*]}; i++)); do
			if [ "${array[$i]}" = "$1" ]; then
				((encontre++))
				unset array[$i]
				array=(${array[*]})
				break
			fi
		done
		if [ $encontre -ne 1 ]; then
			echo "elemento no encontrado"
		fi
	fi
}



#ejemplo

insert "hola"
insert 50
rellenar 4
seleccion "*"
seleccion "juju"
delete "hola"
seleccion "*"
delete "*"
seleccion "*"
















