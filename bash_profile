#
# ~/.bash_profile
#


PATH=$PATH:$HOME/.local/bin
[[ -f ~/.bashrc ]] && . ~/.bashrc
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
   echo "startx to start Windows 95" 
fi

export PATH=$PATH:~/.local/bin
export LANG=en_US.UTF-8
export MPD_PORT=23955
export EDITOR=/usr/bin/nvim
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

#{{{Base ZSH 
# User configuration

 export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
 export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vi'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
 export ARCHFLAGS="-arch x86_64 -O2 -march=native -j4"
#}}}


#{{{NNN

export NNN_OPTS="goxa"
export NNN_BMS="h:~/;D:~/Documents;d:~/Desktop/;V:~/Videos/;M:~/Music/;l:~/Downloads"
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip|zst|zstd)$"
export NNN_TRASH=0
export NNN_COLORS="4444"
export NNN_PLUG="i:imgview;o:launch;C:mp3conv;P:picker;v:pdfread;b:nbak;l:oldbigfile;f:organize"
export NNN_OPS_PROG=1
#}}}

#{{{BAT
#export BAT_THEME="base16"
#}}}

#{{{Fuck
#eval $(thefuck --alias)
#}}}


