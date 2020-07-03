#!/bin/bash

dunst &
nitrogen --restore &
picom &
fcitx &
pkill bar.sh
exec "./bar.sh" 
xsetroot -solid "#282828"

