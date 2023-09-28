if [ $# -ne 3 ]; then
	echo "dale, passa bien los parametros, tenes que hacer ( nombrearchivo -a cadenaagregada )"
	exit 1
fi
filename=$1
flag=$2
string=$3

if [ ! -d $filename ]; then
	echo "pero poneme un directorio que exista mi amor"
	exit 2
fi

cd $filename

case $flag in
	#podria haber hecho for archive in "ls $filename"
	#No hacia falta fijarse si era archivo, porque no afecta si es directorio
	-a)for archive in *; do
		if [ -f $archive ]; then
			mv "$archive" "${archive}${string}"
		fi
	done
	;;
	-b)for archive in *; do
		if [ -f $archive ]; then
			mv "$archive" "${string}${archive}"
		fi
	done
	;;
	*)echo "invalid flag";;
esac

