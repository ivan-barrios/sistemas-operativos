#Verify that there is a parameter
if [ $# != 1 ]; then
	echo "pasa parametro, baby"
	exit 1
fi

ext=$1
report="report.txt"
touch $report

for dir in /home/*; do
	if [ -d $dir ]; then
		#Get the username of the owner
		username=$(basename $dir)
		#Count the amount of files with the extension (wc -l counts the number of lines that the previous command found)
		count=$(find $dir -type f -name "*.$ext" | wc -l)
		echo "$username : $count" >> $report
	fi
done
echo "Report done un report.txt"
