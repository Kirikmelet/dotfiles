#!/bin/sh
DATE(){
	DATE=$(date "+%y/%m/%d %H:%M")
	echo "$DATE"
}

BAT(){
	BAT=$(acpi | awk '{printf "%s ", $4}'| sed 's/\,//g' | awk '{sum = $1 + $2 } {sum = sum / 2} END {printf "%s%", sum}')
	echo "$BAT"


}

NET(){
	SSID=$(nmcli -t -f NAME connection show --active)
	SPEED=$( grep "^\s*w" /proc/net/wireless | awk '{ print int($3 * 100 / 70) "%" }')
	echo "$SSID $SPEED"

}

while true; do
	xsetroot -name "$(NET) |$(DATE) | $(BAT)"
	sleep 5
done
