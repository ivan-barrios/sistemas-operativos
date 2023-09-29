#!/bin/bash

array=($(cat /etc/passwd | cut -d: -f1))

existe(){
	if [ $# -ne 1 ]; then
		echo "lo palametlo etan mal"
		return 2
	fi
	for usr in ${array[*]}; do 
		if [ $usr == $1 ]; then
			return 0
		fi
	done
	return 1
}

eliminar_usuario(){
	if [ $# -ne 1 ]; then
		echo "poneme bien lo palametlo"
		return 1
	fi

	if ! existe $1; then
		echo "El usuario no existe"
		return 2
	else
		index=-1
		for ((i=0; i<${#array[*]}; i++)); do
			if [ "${array[$i]}" = "$1" ]; then
				index=$i
				break
			fi
		done
		#Ya me habia asegurado de que existia el usuario
		unset array[$i]
		array=(${array[*]})
		echo "Usuario eliminado exitosamente"
	fi
}




usuarios_con_patron(){
	if [ $# -ne 1 ]; then
		echo "Parametros mal"
		exit 1
	fi

	#no me funciona haciendo echo "${array[*]}" | grep "$1" ... por que?
	
	for usr in ${array[*]}; do
		if [[ $usr == *$1* ]]; then
			echo "$usr"
		fi
	done
}


cantidad(){
	echo "Cantidad de usuarios en arreglo: ${#array[*]}"
}


usuarios(){
	echo "Usuarios: ${array[*]}"
}



select option in existe eliminar_usuario usuarios_con_patron cantidad usuarios salir; do
	case $option in
		"existe")
			echo "Ingrese usuario para verificar que exista:"
			read usr
			if existe $usr; then
				echo "El usuario existe"
			else
				echo "El usuario no existe"
			fi
		;;

		"eliminar_usuario")
			echo "Ingrese un usuario para eliminarlo:"
			read usr
			eliminar_usuario $usr
		;;
		
		"usuarios_con_patron")
			echo "ingrese un patron para filtrar usuarios"
			read patron
			usuarios_con_patron $patron
		;;
		
		"cantidad")
			cantidad
		;;
		"usuarios")
			usuarios
		;;
		"salir")
			exit 0
		;;
	esac
done


























