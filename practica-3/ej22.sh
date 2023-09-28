num=(10 3 5 7 9 3 5 4)

productoria(){
	result=1
	for ((i=0; i<${#num[@]}; i++)); do
		((result*=${num[i]}))
		echo "$result"
	done
	echo "Final Result: $result"
}

productoria
