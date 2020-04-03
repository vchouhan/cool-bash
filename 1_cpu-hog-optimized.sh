#!/bin/bash

while true; do
	sleep 10
	GETUSAGE=($(ps -eo pcpu,pid -o comm= | sort -k1 -n -r | head -1))
	USAGE=${GETUSAGE[0]%.*}
	PID=${GETUSAGE[1]}
	PNAME=${GETUSAGE[2]}

	echo "THE USAGE VALUE IS: $USAGE $PID $PNAME"

	if [ $USAGE -gt 15 ]; then
		sleep 10
		GETUSAGE2=($(ps -eo pcpu,pid -o comm= | sort -k1 -n -r | head -1))
		USAGE1=${GETUSAGE2[0]%.*}
		PID1=${GETUSAGE2[1]}
		PNAME1=${GETUSAGE2[2]}
		[ $USAGE1 -gt 15 ] && [ $PID1 = $PID ] && echo "CPU load of $PNAME1 is $USAGE1, and above 15% threshold"
	fi
done
