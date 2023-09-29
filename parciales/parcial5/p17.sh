#!/bin/bash

#Listado con todos los nombres de usuario que poseen mail.
#Cuando un usuario tiene cuenta de mail, posee un directiorio llamado mailDir en su directorio /home/nombredeusuario
#Ademas de tener mail, deben tener bash como shell por defecto

if [ $# -ne 0 ]; then
	echo "No se deben pasar parametros"
	exit 1
fi


for i in $(cat /etc/passwd); do
	user=$(echo $i | cut -d: -f1)
	personaldir=$(echo $i | cut -d: -f6)
	usershell=$(echo $i | cut -d: -f7)

	if [ -d "$personaldir/mailDir" ] && [ "$usershell" = "/bin/bash" ]; then
		echo "$user" >>/home/ivan-barrios/repos/sistemas-operativos/parciales/parcial5/listado.txt
		echo "Se agregó $user al listado"
	fi
done




