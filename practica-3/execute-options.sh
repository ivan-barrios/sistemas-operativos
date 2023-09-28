options="$(ls *.sh) Salir"

echo "$options"

select opt in $options; do
	if [ $opt = "Salir" ]; then
		break
	fi
	bash $opt
done
