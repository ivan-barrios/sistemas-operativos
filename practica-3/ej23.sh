array=(1 2 3 4 5 6 7 8 9)

func() {
	impares=0

	for num in ${array[@]}; do
		if ((num % 2 == 0)); then
			echo "Par"
		else
			((impares++))
		fi
	done
	echo "cant impares: $impares"
}

func
