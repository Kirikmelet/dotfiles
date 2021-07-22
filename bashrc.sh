# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

source ~/.config/bash/tmux.sh
source ~/.config/bash/ps1.sh
source ~/.config/bash/path.sh
source ~/.config/bash/alias.sh
source ~/.config/bash/nnn-config.sh
source ~/.config/bash/env.sh

#set -o vi


#alias luamake=/home/troyd/.local/opt/lua-language-server/3rd/luamake/luamake
