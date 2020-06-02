#!/bin/bash

dunst &
nitrogen --restore &
picom &
exec "./bar.sh" &

