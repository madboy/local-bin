#!/bin/bash

echo "we are going to sleep for $1 minute(s)"
for ((i=1; i <= $1; i++))
do
    sleep 60
    if [ $i -gt 1 ]; then
	echo "$i minutes have passed"
    else
	echo "$i minute has passed"
    fi
done
