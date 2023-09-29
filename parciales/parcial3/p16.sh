#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Debe ingresar al menos un parametro"
	exit 1
fi

notexistent=0

for route in "$@"; do
	if [ -f $route ]; then
		gzip $route
	elif [ -d $route ]; then
		if [ -r $route ]; then
			tar -czvf "$(basename "$route").tar.gz" "$route"
		elif [ -w $route ]; then
			rm -r "$route"
		fi
	else
		((notexistent++))
	fi
done

echo "La cantidad de elementos inexistentes es: $notexistent"
