#!/bin/sh

alsa=$(amixer get Master | awk -F "[][]" '{print $2}')

echo $alsa
