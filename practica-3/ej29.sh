#!/bin/bash

array=()

for i in $(find "/home/ivan-barrios/repos/sistemas-operativos/practica-3" -type f -name "*.doc"); do
	array=(${array[*]} $i);
done

echo "${array[*]}"

verArchivo(){
	if [ $# -ne 1 ]; then
		echo "Pasame el nombre del archivo como parametro pls"
		return 1
	fi
	found=false

	for i in ${array[*]}; do
		if [ $i == $1 ]; then
			found=true
			cat /home/$i
			break
		fi
	done
	if [ $found == false ]; then
		echo "File not found"
	fi
}



cantidadArchivos(){
	echo "La cantidad de archivos con terminación .doc es: ${#array[*]}"
}



borrarArchivo(){
	if [ $# -ne 1 ]; then
		echo "Pasame un archivo .doc como parametro pls"
		return 1
	fi

	existe=false
	for i in ${array[*]}; do
		if [ $i == $1 ]; then
			existe=true
		fi
	done

	if [ ! $existe ]; then
		echo "El archivo no encontrado"
		return 10
	fi
	
	echo "Deseas eliminar lógicamente (Si) o también del FileSystem (No)?"	
	read respuesta

	if [ $respuesta == "Si" ]; then
		unset array[$i]
		array=(${array[*]})
		echo "Archivo eliminado del array"	
	elif [ $respuesta == "No" ]; then
		unset array[$i]
		array=(${array[*]})
		echo "Archivo eliminado del array"
		rm "/home/$1"
		echo "Archivo eliminado del FileSystem"
	else
		echo "Respuesta inválida"
	fi
}



select option in verArchivo cantidadArchivos borrarArchivo Salir 
do
	case $option in
		"verArchivo")
			echo "Ingrese nombre del archivo:"
			read nombre
			verArchivo $nombre
			;;
		"cantidadArchivos")
			cantidadArchivos
			;;
		"borrarArchivo")
			echo "Ingrese archivo a borrar:"
			read archivo
			borrarArchivo $archivo
			;;
		"Salir")
			echo "Gracias por todo loco"
			exit 0
			;;
	esac

done






























