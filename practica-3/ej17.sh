for file in *; do
	if [ -f $file ]; then
		echo "$file" | tr -d aA | tr "b-zB-Z" "B-Zb-z"
	fi
done
