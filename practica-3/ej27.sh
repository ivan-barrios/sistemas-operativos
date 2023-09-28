#!/bin/bash
array=()

#inicializar: Crea un arreglo llamado array vacío
inicializar()
{
	array=();
	echo "Arreglo Inicializado"
}


#agregar_elem <parametro1>: Agrega al final del arreglo el parámetro recibido
agregar_elem()
{
	if [ $# -ne 1 ]; then
		echo "Tenes que pasar UN parametro"
		return 1
	fi
	
	array=(${array[*]} $1);
	echo "Elementro $1 agregado"
}



#eliminar_elem <parametro1>: Elimina del arreglo el elemento que se encuentra en la
#posición recibida como parámetro. Debe validar que se reciba una posición válida
eliminar_elem()
{
	if [ $# -ne 1 ]; then
		echo "Tenes que pasar un parametro"
		return 1
	fi

	if [ $1 -ge ${#array[*]} ]; then
		echo "Ingresa una posicion valida"
		return 2
	fi

	unset array[$1]
	array=(${array[*]});
	echo "Se elimino el elemento de la posicion $1"

}



#longitud: Imprime la longitud del arreglo en pantalla
longitud()
{
	echo "Longitud: ${#array[*]}"
}



#imprimir: Imprime todos los elementos del arreglo en pantalla
imprimir()
{
	echo "${array[*]}";
}



#inicializar_Con_Valores <parametro1><parametro2>: Crea un arreglo con longitud
#<parametro1>y en todas las posiciones asigna el valor <parametro2>
inicializar_Con_Valores()
{
	if [ $# -ne 2 ]; then
		echo "Pasa dos parametros"
		return 1
	fi

	inicializar

	for ((i=0; i < $1; i++))
       	do
		agregar_elem $2
	done

	echo "Arreglo inicializado con $1 veces $2"
}



select action in inicializar agregar_elem eliminar_elem longitud imprimir inicializar_Con_Valores salir
do
	case $action in
		"inicializar")
			inicializar
			;;
		"agregar_elem")
			echo "Ingresar elemento a agregar: "
			read elem
			agregar_elem $elem
			;;
		"eliminar_elem")
			echo "Ingresar posicion a eliminar: "
			read pos
			eliminar_elem $pos
			;;
		"longitud")
			longitud
			;;
		"imprimir")
			imprimir
			;;
		"inicializar_Con_Valores")
			echo "Ingresar cantidad de elementos a inicializar: "
			read cant
			echo "Ingresar valor de inicializacion: "
			read valor
			inicializar_Con_Valores $cant $valor
			;;
		"salir")
			exit 0
			;;
	esac
done





