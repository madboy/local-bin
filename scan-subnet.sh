#!/usr/bin/env bash

cip=`ifconfig  | grep 'inet '| grep -v '127.0.0.1' | awk '{ print $2}'`

tip=`echo $cip | perl -pe 's/(\d{1,3}\.\d{1,3}\.\d{1,3}\.)(\d{1,3})/$1/'`
tail=`echo $cip | perl -pe 's/(\d{1,3}\.\d{1,3}\.\d{1,3}\.)(\d{1,3})/$2/'`
start=`expr $tail - 10`
end=`expr $tail + 10`

if command -v nmap; then
    nmap -sP ${tip}${start}-${end}
else
    for ((i=start; i <=end; i++)) do
    	ping -t 1 $tip$i > /dev/null && echo "${tip}${i} is up";
    done
fi
