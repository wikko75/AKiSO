#!/bin/bash

#arrays holding PIDs of all runnning proceses
processesArray=($(ls /proc | grep '[0-9]'))

echo -e "PID Name State PPID PGID SID TTY RSS Files" >> file.txt

for PID in ${processesArray[@]}
do
	if [ -e /proc/$PID ]
	then
		detailsArray=($(</proc/$PID/stat))
		openFiles=$(sudo ls /proc/$PID/fd | more | wc -l)

		echo -e ${detailsArray[0]} ${detailsArray[1]} ${detailsArray[2]} ${detailsArray[3]} ${detailsArray[4]} ${detailsArray[5]} ${detailsArray[6]} ${detailsArray[23]} $openFiles >> file.txt
	fi
done

	column -t file.txt
	rm file.txt

#echo -e "PID" "Name" "State" "PPID" "PGID" "SID" "TTY" "RSS\n" ${detailsArray[0]} ${detailsArray[1]} ${detailsArray[2]} ${detailsArray[3]} ${detailsArray[4]} ${detailsArray[5>
