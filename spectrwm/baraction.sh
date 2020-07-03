#!/bin/sh


SLETIM=5

function BAT(){
    BAT1=$(acpi | awk '{printf "%s ", $4}' | sed 's/\,//g' | awk '{sum = $1 + $2 } END {printf "%s%", sum}')
    echo $BAT1

}
function ALSA(){
    AUDIO=$( amixer get Master | tr -d '[]' | awk 'FNR == 5 {print $4}')
    echo $AUDIO
}

while true; do
    echo -e "VOL: $(ALSA) BAT: $(BAT)"

	sleep 1
done
