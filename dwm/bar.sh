#!/bin/sh
DATE(){
	DATE=$(date "+%y/%m/%d %H:%M")
	echo "$DATE"
}

BAT(){
	BAT=$(acpi | awk '{printf "%s ", $4}'| sed 's/\,//g' | sed 's/\ //')
	echo "$BAT"


}

NET(){
	SSID=$( connmanctl services | grep "*A" | awk '{print $2}')
	SPEED=$( grep "^\s*w" /proc/net/wireless | awk '{ print int($3 * 100 / 70) "%" }')
	echo "$SSID"

}

VOLUME(){
    #VOL=$(amixer get Master | awk -F "[][]" '{printf $2}')
    VOL=$(pamixer --get-volume)
    echo "$VOL%"


}

while true; do
	xsetroot -name "|[NET: $(NET)][VOL: $(VOLUME)][DATE: $(DATE)][BAT: $(BAT)]"
	#echo -e "[ $(NET)][蓼$(VOLUME)][ $(DATE)][ﮣ $(BAT)]"
	sleep 1
done
