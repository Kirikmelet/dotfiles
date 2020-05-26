#!/bin/sh
DATE(){
	DATE=$(date "+%y/%m/%d %H:%M")
	echo "$DATE"
}

BAT(){
	BAT=$(acpi | awk '{printf "%s ", $4}'| sed 's/\,//g')
	echo "$BAT"


}

NET(){
	SSID=$( connmanctl services | grep "*AR" | awk '{print $2}')
	SPEED=$( grep "^\s*w" /proc/net/wireless | awk '{ print int($3 * 100 / 70) "%" }')
	echo "$SSID $SPEED"

}

while true; do
	xsetroot -name "$(NET) |$(DATE) | $(BAT)"
	sleep 5
done
