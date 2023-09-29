#!/bin/bash


if [ $# -lt 1 ]; then
	echo "Cantidad insuficiente de parametros"
	exit 1
fi

array=($@)


existe(){
	if [ $# -ne 1 ]; then
		echo "A la funcion existe solo se le tiene que pasar un parametro"
		return 2
	fi

	for ((i=0; i<${#array[*]}; i++)); do
		if [ $1 = ${array[$i]} ]; then
			echo "El indice dentro del arreglo de $1 es $i"
			return 0
		fi
	done
	return 1
}


replace(){
	if [ $# -ne 2 ]; then
		echo "No se pasaron bien los parametros de replace"
		return 2
	fi

	if existe $1; then
		for ((i=0; i<${#array[*]}; i++)) ; do
			if [ ${array[$i]} = $1 ]; then
				array[$i]=$2
				echo "Reemplazado exitosamente"
			fi
		done
	fi
}


eliminar(){
	if [ $# -ne 1 ]; then
		echo "Malos parametros en eliminar"
		return 1
	fi

	if existe $1; then
		for ((i=0; i<${#array[*]}; i++)); do
			if [ ${array[$i]} = $1 ]; then
				unset array[$i]
				array=(${array[*]})
				echo "Eliminado correctamente"
			fi
		done
	else
		return 2
	fi
}


cantidad(){
	echo "La cantidad es ${#array[*]}"
}

todos(){
	echo "Todos los elementos son: ${array[*]}"
}



select option in existe replace eliminar cantidad todos salir; do
	case $option in
		"existe")
			echo "Ingresar elemento a verificar"
			read elem
			existe $elem
			;;

		"replace")
			echo "Ingrese el elemento que quiere reemplazar"
			read elem
			echo "Ingrese el elemento por el que quiere reemplazar"
			read reemplazo
			replace $elem $reemplazo
			;;

		"eliminar")
			echo "iNgrese el elemento que quiere eliminar"
			read elem
			eliminar $elem
			;;

		"cantidad")
			cantidad
			;;

		"todos")
			todos
			;;

		"salir")
			exit 0
			;;

	esac
done






