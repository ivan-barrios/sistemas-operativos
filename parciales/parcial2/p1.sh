#!/bin/bash

array=($(cat /home/ivan-barrios/repos/sistemas-operativos/parciales/parcial2/municipios.txt | cut -d' ' -f1))

existeMunicipio()
{
	if [ $# -ne 1 ]; then
		echo "Cantidad de parametros incorrecta"
		return 1
	fi
	
	for i in ${array[*]}; do
		if [ $i == $1 ]; then
			return 0
		fi
	done
	return 2
}


agregarMunicipio()
{
	if [ $# -ne 1 ]; then
		echo "Parametros incorrectos"
		return 1
	fi

	if existeMunicipio $1; then
		echo "Ya existe ese municipio"
		return 2
	else
		array=(${array[*]} $1)
		return 0	
	fi
}


listarMunicipios()
{
	echo "Lista de municipios: ${array[*]}"
}

cantidadMunicipios()
{
	echo "Cantidad de municipios: ${#array[*]}"
}

select i in existeMunicipio agregarMunicipio listarMunicipios cantidadMunicipios Salir; do
	case $i in
		"existeMunicipio")
			echo "Ingresa un municipio para saber si ya existe"
			read muni
			if existeMunicipio "$muni"; then
				echo "$muni ya existe"
			else
				echo "$muni no existe todavia"
			fi
		;;

		"agregarMunicipio")
			echo "Ingresa un municipio para agregar"
			read municipio
			if agregarMunicipio "$municipio"; then
				echo "Se agrego $municipio con exito"
			else
				echo "No se pudo agregar $municipio"
			fi
		;;

		"listarMunicipios")
			listarMunicipios
		;;

		"cantidadMunicipios")
			cantidadMunicipios
		;;

		"Salir")
			exit 0
		;;


	esac
done








