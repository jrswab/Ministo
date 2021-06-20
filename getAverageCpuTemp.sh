#!/bin/sh

hasCoreTemp=$(sensors | grep 'coretemp')
if [ ! "$hasCoreTemp" = "" ]; then
	cpus=$(sensors | awk '/Core/ { print $3 }' | sed 's/\+//' | sed 's/°C//')

	n=0
	i=0
	sum=0

	for _ in $cpus; do
		n=$((n+1))
	done

	while [ $i -le $n ]; do
		i=$((i+1))
	done

	for num in $cpus; do
		sum=$(echo "$sum" + "$num" | bc -l)
	done

	avgTemp="$(echo "$sum" / "$n" | bc -l)"
	printf '%0.1f°C' "$avgTemp"
	exit 0;
fi

## Some AMD Ryzen CPUs report CPU tempurature with "Tdie" in `sensors`
sensors | awk '/Tdie:/ { print $2}' && exit 0;
