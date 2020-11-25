interface=$1
interval=$2

DIR="/sys/class/net"
check="$DIR/$interface"

if [ ! -z "$interface" -a ! -z "$interval" ]; then
	if [ -e $check ]; then
		if echo $interval | egrep -q '^[1-9][0-9]*$'; then
			echo "Executing on interface $interface with interval $interval"
			command touch packets.csv
			echo "Sent,Received,TimeStamp">packets.csv
			for i in $(seq 1 1 10); do
				sentLine=`ifconfig $interface | tail -3 | head -1`
				sentPackets=`echo $sentLine | cut -d ' ' -f3`
				receivedLine=`ifconfig $interface | tail -5 | head -1`
				receivedPackets=`echo $receivedLine | cut -d ' ' -f3`
				echo $sentPackets,$receivedPackets,`date +%T`>>packets.csv
				sleep $interval
			done
			echo "Finished running. Output is in packets.csv"
		else
			echo "Error: Interval must be a number"
		fi
	else
		echo "Error: Interface doesnt exist"
	fi
else
	echo "Error: Either the interface or interval havent been provided"
fi
