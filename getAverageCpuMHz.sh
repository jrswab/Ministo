#! /bin/sh

cpus=$(awk '/cpu MHz/ { print $4 }' /proc/cpuinfo)

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

mhz="$(echo "$sum" / "$n" | bc -l)"
printf '%0.2fGHz' "$(echo "$mhz" / 1000 | bc -l)"
exit 0;
