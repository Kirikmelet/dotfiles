#!/bin/bash

fcitx5 &
pkill bar.sh
exec "~/.local/share/dwm/bar.sh" &
xwallpaper --zoom ~/Pictures/wallpapers/professional/systemd-wp-alt.png
