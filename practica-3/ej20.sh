pila=()

push(){
	item=$1
	pila+=("$item")
}

pop() {
	if [ ${#pila[@]} -eq 0 ]; then
		echo "La pila esta vacia"
	else
		index=$((${#pila[@]}-1))
		echo "Deleted element: ${pila[$index]}"
		unset pila[$index]
	fi
}

lenght(){
	echo "${#pila[@]}"
}

print(){
	for ((i=${#pila[@]}-1; i>=0; i--)); do
		echo "${pila[i]}"
	done
}

push "item1"
push "item2"
push "item3"
push "item4"
push "item5"
push "item5"
push "item6"
push "item7"
push "item8"
push "item9"

pop
pop
pop

lenght

print


