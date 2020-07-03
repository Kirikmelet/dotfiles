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
	SSID=$(iw dev wlp3s0 link | awk 'FNR == 2 {print $2}')
	SPEED=$( grep "^\s*w" /proc/net/wireless | awk '{ print int($3 * 100 / 70) "%" }')
	echo "$SSID"

}


MPC(){
    MPC=$(mpc | awk 'NR==1')
    echo "$MPC"

}

VOLUME(){
    VOL=$(amixer get Master | awk 'FNR == 5 {printf $4}' | tr -d "[]")
    #VOL=$(pamixer --get-volume)
    echo "$VOL"


}

while true; do
    xsetroot -name "|[NET: $(NET)][VOL: $(VOLUME)][DATE: $(DATE)][BAT: $(BAT)]"
    echo -e "|[NET: $(NET)][VOL: $(VOLUME)][DATE: $(DATE)][BAT: $(BAT)]"
	sleep 1
done
