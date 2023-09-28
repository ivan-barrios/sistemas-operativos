if [ $# != 3 ]; then
	echo "You should pass the correct parameters (bash c.sh + 3 4)"
	exit 1
fi
op=$1
num1=$2
num2=$3
case $op in 
	+) echo "$num1 + $num2 = $(expr $num1 + $num2)";;
	-) echo "$num1 - $num2 = $(expr $num1 - $num2)";;
	"*") echo "$num1 "*" $num2 = $(expr $num1 "*" $num2)";;
	/) echo "$num1 / $num2 = $(expr $num1 / $num2)";;
	*) echo "Invalid operator";;
esac
