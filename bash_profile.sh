#!/bin/bash
# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Autostart X11
#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#    exec startx
#elif [ "${TMUX}" ]; then
#    return
#else
#    neofetch
#fi

# Set editor/visual
export VIEWER=bat
export EDITOR=emacs\ -nw

# User specific environment and startup programs

export DOTBARE_DIR="$HOME/dotfiles"

#{{{NNN
export NNN_OPTS="goa"
export NNN_BMS="h:~/;D:~/Documents;d:~/Desktop/;V:~/Videos/;M:~/Music/;l:~/Downloads"
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip|zst|zstd)$"
export NNN_TRASH=0
export NNN_COLORS="4444"
export NNN_PLUG="i:imgview;o:launch;C:mp3conv;P:picker;v:pdfread;b:nbak;l:oldbigfile;f:organize;g:gpge;G:gpgd"
export NNN_OPS_PROG=1
#}}}

#{{{BAT
#export BAT_THEME="base16"
#}}}


# INPUT
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=\@im=fcitx
export SDL_IM_MODULE=fcitx

# MPD
export MPD_PORT=23955
