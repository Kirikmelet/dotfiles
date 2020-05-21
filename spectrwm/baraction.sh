#!/bin/sh


SLETIM=5



while :; do
	echo -e $(acpi | awk '{printf "%s ", $4}'| sed 's/\,//g' | awk '{sum = $1 + $2 } {sum = sum / 2} END {printf "%s%", sum}')
	sleep $SLETIM
done
