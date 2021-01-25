#!/bin/bash

fcitx5 &
nm-applet &
pkill bar.sh
exec "~/.local/share/dwm/bar.sh" &
xwallpaper --zoom ~/Pictures/wallpapers/professional/systemd-wp-alt.png
