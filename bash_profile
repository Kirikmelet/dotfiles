#
# ~/.bash_profile
#


PATH=$PATH:$HOME/.local/bin
[[ -f ~/.bashrc ]] && . ~/.bashrc
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
   echo "startx to start LXQT"
fi


export PSREFIX="$HOME/.photoshopCCV19/prefix/"

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

#{{{Fuck
#eval $(thefuck --alias)
#}}}


