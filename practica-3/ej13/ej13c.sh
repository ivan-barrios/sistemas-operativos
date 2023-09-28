if [ $# != 1 ]; then
	echo "da loco, una sola cosa tenias que hacer, pone bien el parametro"
	exit 1
fi
nombre=$1
if [ -e $nombre ]; then
	echo "$nombre exists."
	if [ -d $nombre ]; then
		echo "and it is a directory"
	else
		echo "and it is a file"
	fi
else
	mkdir $nombre
fi
