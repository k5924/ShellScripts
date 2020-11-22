readOne () {
	local oldstty
	oldstty=$(stty -g)
	stty -icanon -echo min 1 time 0
	dd bs=1 count=1 2>/dev/null
	stty "$oldstty"
}

while : ; do
	command clear
	# clears the terminal screen

	echo "Input the first number> \c"
	read num1
	echo "\nInput the second number> \c"
	read num2
	# read number input from user

	if echo $num1 | egrep -q '^-*[0-9]+$' && echo $num2 | egrep -q '^-*[0-9]+$'; then

		echo "\nWould you like to: \n-Add (Add)\n-Subtract (Sub)\n-Multiply (Mul)\n-Divide (Div)\n-Modulus (Mod)\n> \c"
		read operation
		# read operation to perform

		case $operation in
	
			"Add")
				echo "\n$num1 + $num2 = `expr $num1 + $num2`";;
			"Sub")
				echo "\n$num1 - $num2 = `expr $num1 - $num2`";;
			"Mul")
				echo "\n$num1 x $num2 = `expr $num1 \* $num2`";;
			"Div")
				echo "\n$num1 / $num2 = `expr $num1 / $num2`";;
			"Mod")
				echo "\n$num1 % $num2 = `expr $num1 % $num2`";;
			*)
				echo "\nOperation not supported";;
		esac
	
	else
		echo "Error: either the first or second inputted value isnt a number"
	fi

	echo "Press any key to contine or Ctl+C to exit \c"
	key=$(readOne)
done
