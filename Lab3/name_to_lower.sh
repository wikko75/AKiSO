#!/bin/sh

IFS=""

for file in ./*
do
	if [ -f "$file" ]
	then
		mv $file $(echo $file | tr '[A-Z]' '[a-z]')
	fi
done

