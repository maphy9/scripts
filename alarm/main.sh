#!/bin/sh

read -p "Enter date [HH-MM dd-mm-yyyy]: " in
arr=($in)

t1=$(echo ${arr[0]} | tr "-" " ")
t1=($t1)
hour=${t1[0]}
minute=${t1[1]}

t2=$(echo ${arr[1]} | tr "-" " ")
t2=($t2)
day=${t2[0]}
month=${t2[1]}
year=${t2[2]}

while [ true ]; do
	current_year=$(date "+%Y")
	current_month=$(date "+%m")
	current_day=$(date "+%d")
	current_hour=$(date "+%H")
	current_minute=$(date "+%M")

	if [ $current_year -gt $year ]; then
		break
	elif [ $current_month -gt $month ]; then
		break
	elif [ $current_day -gt $day ]; then
		break
	elif [ $current_hour -gt $hour ]; then
		break
	elif [ $current_minute -ge $minute ]; then
		break
	fi

	sleep 5
done

echo "PRESS <CTRL-C> TO STOP THE ALARM"
mpg123 -q --loop -1 alarm.mp3
