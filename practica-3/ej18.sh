if [ $# -ne 1 ]; then
	echo "pass di parameter"
	exit 1
fi

user=$1

existe=$( cat /etc/passwd | cut -d : -f 1 | grep -w $1 | wc -l )
if [ $existe -eq 0 ]; then
	echo "No existe el usuario"
	exit 1
fi

while true; do
	#Veo si está conectado o no
	#users en lugar de grep
	if  who | grep -w -q "$user" ; then
		echo "Usuario $user logueado en el sistema."
		exit 0
	fi
	sleep 10
done
