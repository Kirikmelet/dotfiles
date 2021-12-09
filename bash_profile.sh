#!/bin/bash
# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

. ~/dotfiles/bash/functions.sh

# Autostart X11
# if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#     exec startx
# elif [ "${TMUX}" ]; then
#     return
#     # neofetch
# fi

# User specific environment and startup programs
#. ~/.config/bash/nnn-config.sh
source_file ~/.config/bash/wine.sh
source_file ~/.config/bash/nnn-config.sh

# INPUT
source_file ~/.config/bash/input.sh

# Spotify 
# source_file ~/.config/bash/spotify.sh


