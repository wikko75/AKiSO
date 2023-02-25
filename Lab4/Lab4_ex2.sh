#/bin/bash


while true
do
	echo -e "Data transmitted: " $(cat /proc/net/dev | awk '/lo/ {print $2}')
	echo -e "Data received : " $(cat /proc/net/dev | awk '/lo/ {print $10}') "\0"

	dataT1=$(cat /proc/net/dev | awk '/lo/ {print $2}')
	sleep 1
	
	dataT2=$(cat /proc/net/dev | awk '/lo/ {print $2}')
	
	echo -e "Data transmittion speed: " $( echo $dataT2-$dataT1 | bc )
	
	echo $(cat /proc/stat | grep cpu | tail -1|awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}'|awk '{print "CPU Usage: " 100-$1}')
	
	echo $(cat /proc/stat |grep cpu0 |tail -1|awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}'|awk '{print "Core1 Usage: " 100-$1}')
	echo $(cat /proc/cpuinfo  | grep Hz | head -2| tail +2 | awk '/MHz/ {print "Speed: " $4 "MHz"}')
	
	echo $(cat /proc/stat |grep cpu1 |tail -1|awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}'|awk '{print "Core2 Usage: " 100-$1}')
	echo $(cat /proc/cpuinfo  | grep Hz | head -4| tail +4 | awk '/MHz/ {print "Speed: " $4 "MHz"}')

	echo $(cat /proc/stat |grep cpu2 |tail -1|awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}'|awk '{print "Core3 Usage: " 100-$1}')
	echo $(cat /proc/cpuinfo  | grep Hz | head -6| tail +6 | awk '/MHz/ {print "Speed: " $4 "MHz"}')

	echo $(cat /proc/stat |grep cpu3 |tail -1|awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}'|awk '{print "Core4 Usage: " 100-$1}')
	echo $(cat /proc/cpuinfo  | grep Hz | head -8| tail +8 | awk '/MHz/ {print "Speed: " $4 "MHz"}')

	echo ""	

	timeIN=$(cat /proc/uptime | awk '{print $1}')
	min=$(echo $timeIN/60 | bc)
	sec=$(echo $timeIN-$min*60 | bc)
	h=$(echo $min/60 | bc)
	min=$(echo $min-$h*60 | bc)
	day=$(echo $h/24 | bc)
	h=$(echo $h-$day*24 |bc)
	echo "Time in use: " $day "days " $h "hours " $min "minutes " $sec "seconds"

	echo ""
	

	echo  $(cat /sys/class/power_supply/BAT0/uevent | grep POWER_SUPPLY_CAPACITY | head -1 | awk '{print $1 "%"}')

	echo ""
	

	echo "Load Average: " $(cat /proc/loadavg)

	echo ""
	
	echo "Memory Status: "$(cat /proc/meminfo | head -3)
	echo ""
	echo ""

done
