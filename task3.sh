if echo $1 | egrep -q '^-*[0-9]+$'; then
	echo "Binary \c"
	echo "obase=2; $1 " | bc
	echo "Octal \c"
	echo "obase=8; $1 " | bc
	echo "Hexadecimal \c"
	echo "obase=16; $1 " | bc
else
	echo "Value entered isnt a whole decimal number"
fi
