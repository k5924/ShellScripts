if echo $1 | egrep -q '^-*[0-9]+$' && echo $2 | egrep -q '^-*[0-9]+$'; then
	# test inputed values against regex for numbers in terminal window

	if [ $1 -eq 0 -o $2 -eq 0 ]; then
		echo "The inputs must be non-zero values"
		# if one of the inputs is 0 the gcd is 0
	else
		if [ $1 -gt $2 ]; then
        		max=$1
		else
        		max=$2
		fi
		# store the largest of the two inputs in the max variable

		for i in $(seq 1 1 $max); do
        		if [ `expr $1 % $i` -eq 0 -a `expr $2 % $i` -eq 0 ]; then
                		gcd=$i
        		fi
		done
		# store the largest common divisor in the gcm variable if both numbers are divisible by it

		echo "$gcd"
		# output gcd value to terminal window
	fi

else
	echo "Error: either the first or second value entered isnt a number"
	# if any of the inputted values are numbers, error message is displayed

fi
