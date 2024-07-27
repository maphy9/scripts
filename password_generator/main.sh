#!/bin/sh

read -p "Enter length: " length
special="~!@#$%^&*()_+-={}[]|<>?:;"
special_length=${#special}
password=""

i=0
while [ $i -lt $length ]; do
	is_special=$((RANDOM % 3))
	new_char=""
	if [ $is_special -eq 0 ]; then
		ascii_index=$((RANDOM % 26))
		is_lower=$((RANDOM % 2))
		if [ $is_lower -eq 0 ]; then
			ascii_index=$((ascii_index + 65))
		else
			ascii_index=$((ascii_index + 97))
		fi
		new_char=$(printf "\\x$(printf %x $ascii_index)")
	elif [ $is_special -eq 1 ]; then
		new_char="$((RANDOM % 10))"
	else
		index=$((RANDOM % special_length))
		new_char=${special:index:1}
	fi
	password="${password}${new_char}"
	i=$((i + 1))
done

echo $password
