
  #{{{ Aliases
# alias zshconfig="mate ~/.zshrc" alias ohmyzsh="mate ~/.oh-my-zsh"
     alias ll="ls -l"
     alias todo="todo.sh"
     alias gc="git commit"
     alias ga="git add"
     alias gp="git push"
     alias gf="git fetch"
     alias gI="git init"
     alias gP="git pull"
     alias gst="git status"
     alias gcl="git clone"
     alias p="cat"
     alias cls="clear"
     alias rb=ruby
     alias drag=dragon-drag-and-drop
     alias notes="surf /home/troyd/vimwiki_html/index.html"
     alias vifm="vifmrun"
     alias rnvim="nvim -m"
     alias nvimdiff="nvim -d"
     alias readbat="bat -p"
     alias dsearch="links 'https://duckduckgo.com/?q=$1'"
     alias ytdlmusic="youtube-dl -x --audio-format opus $1"
     #}}}

set -o vi
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
# Emulate an MS-DOS prompt in your Linux shell.
# Laszlo Szathmary (jabba.laci@gmail.com), 2011
# Project home page:
# https://ubuntuincident.wordpress.com/2011/02/08/emulate-the-ms-dos-prompt/
#
#
# Modified by Soldier of Fortran
#
# Add to you ~/.bashrc file with: 'source ~/.themes/95/bashrc'

function msdos_pwd
{
    local dir="`pwd`"

    echo $dir | tr '/' '\\'
}

export PS1='`pwd`/> '

#echo 
#echo
#echo "Microsoft(R) Windows 95"
#echo "  (C)Copyright Microsoft Corp 1981-1994."
#echo


source ~/.local/bin/mdcat.bash
