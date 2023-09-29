#!/bin/bash

if [ $# -ne 1 ]; then
	echo "parametro insuficiones"
	exit 1
fi

while true; do
	
	if [ -f "/var/log/any-service/error.log" ]; then
		cantLineas=$(grep "FATAL ERROR" "/var/log/any-service/error.log" | wc -l )
		if [ $cantLineas -gt 1 ]; then
			tar -czvf "$1/nombre.tar.gz" "/var/log/usr-service"
			break
		fi
	fi
	
	sleep 180
done

echo "$(grep "FATAL ERROR" "/var/log/any-service/error.log" | wc -l )"
