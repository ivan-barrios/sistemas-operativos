select value in "Listar" "DondeEstoy" "QuienEsta"; do
	case $value in
		"Listar") ls;;
		"DondeEstoy") pwd;;
		"QuienEsta") who;;
		*) echo "Come back when you want to work, su****";;
	esac
done
