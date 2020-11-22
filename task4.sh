file1=$1
file2=$2

length1=0
length2=0

if [ -e $file1 -a -e $file2 ]; then
	while read line; do
		length1=$(($length1+1))
	done < $file1

	while read line; do
		length2=$(($length2+1))
	done < $file2

	if [ $length1 != 0 -a $length2 != 0 ]; then
		if [ $length1 -gt $length2 ]; then
			echo "$file1 has more lines"
		elif [ $length1 -eq $length2 ]; then
			echo "$file1 has the same amount of lines as $file2"
		else
			echo "$file2 has more lines"
		fi
	elif [ $length1 -eq 0 -a $length2 != 0 ]; then
		echo "$file1 is empty"
	elif [ $length2 -eq 0 -a $length1 != 0 ]; then
		echo "$file2 is empty"
	else
		echo "Both $file1 and $file2 are empty"
	fi
elif [ -e $file1 -a ! -e $file2 ]; then
	echo "$file2 doesnt exist"
elif [ -e $file2 -a ! -e $file1 ]; then
	echo "$file1 doesnt exist"
else
	echo "Both $file1 and $file2 dont exist"
fi
