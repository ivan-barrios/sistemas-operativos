if [ $# != 2 ]; then
	echo "You should pass two parameters to the script"
	exit 1
fi
num1=$1
num2=$2
echo "$num1 x $num2 = $(expr $num1 "*" $num2)"
echo "$num1 + $num2 = $(expr $num1 + $num2)"
echo "$num1 - $num2 = $(expr $num1 - $num2)"
echo "$num1 / $num2 = $(expr $num1 / $num2)"
if [ $num1 -lt $num2 ]; then
        echo "$num2 is greater than $num1"
elif [ $num1 -gt $num2 ]; then
        echo "$num1 is greater than $num2"
else
        echo "$num1 and $num2 are the same"
fi

