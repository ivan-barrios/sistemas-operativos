vector1=(1 80 65 35 2)
vector2=(5 98 3 41 8)

sumaVectores(){
	if [ ${#vector1[@]} -ne ${#vector2[@]} ]; then
		echo "VECTORS DO NOT HAVE THE SAME DIMENSION"
		exit 1
	fi
	for ((i=0; i<${#vector1[@]}; i++)); do
		suma=$(( ${vector1[$i]} + ${vector2[$i]} ))
		echo "La suma de los elementos de a posicion $i de los vectores es $suma"
	done
}

sumaVectores
