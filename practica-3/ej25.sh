array=($(cat /etc/group | grep users | cut -d: -f4 | tr "," " "))

case $1 in
	-b) if [ $# -eq 2 ]; then
		if (( $2 <= ${#array[@]} )); then
			echo "User en $2 es: ${array[$2]}"
		else
			echo "No hay usuario en esa posicion $2"
		fi
	fi;;
	-l) echo "La longitud es: ${#array[@]}";;
	-i) echo "Los elementos son: ${array[@]}";;
	*) echo "Invalid flag";;
esac
