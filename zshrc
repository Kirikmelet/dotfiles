PS1="Chotto Matte! B-Baka!!! :< "
# If you come from bash you might have to change your $PATH.
# 
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/troyd/.oh-my-zsh"
#{{{Oh My ZSH
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="garyblessington"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as lsty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#}}}

#{{{User configuration

 # export MANPATH="/usr/local/man:$MANPATH"

 # You may need to manually set your language environment
 # export LANG=en_US.UTF-8

 # Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
   else
     export EDITOR='nvim'
     fi

     # Compilation flags
     # export ARCHFLAGS="-arch x86_64"

     # Set personal aliases, overriding those provided by oh-my-zsh libs,
     # plugins, and themes. Aliases can be placed here, though oh-my-zsh
     # users are encouraged to define aliases within the ZSH_CUSTOM folder.
     # For a full list of active aliases, run `alias`.
     #{{{ Aliases

     # alias zshconfig="mate ~/.zshrc"
     # alias ohmyzsh="mate ~/.oh-my-zsh"
     alias ll="exa -l"
     alias todo="todo.sh"
     alias gc="git commit"
     alias gp="git push"
     alias gf="git fetch"
     alias gI="git init"
     alias gP="git pull"
     alias p="cat"
     alias cls="clear"
     alias cls=clear
     alias rb=ruby
     alias drag=dragon-drag-and-drop
     alias notes="surf /home/troyd/vimwiki_html/index.html"
     alias vifm="vifmrun"
     alias ls="exa"
     alias rnvim="nvim -m"
     alias nvimdiff="nvim -d"
     alias readbat="bat -p"
     alias dsearch="w3m 'https://duckduckgo.com/?q=$1'"
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

#{{{Fuck
eval $(thefuck --alias)
#}}}


#{{{zinit

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node


zinit wait"!" lucid light-mode for \
	OMZT::garyblessington \
	OMZP::git \

zinit light zsh-users/zsh-autosuggestions \
	

zinit wait lucid light-mode for \
	atinit"zicompinit; zicdreplay"  \
        	zdharma/fast-syntax-highlighting \
      		OMZP::colored-man-pages \
	blockf atpull"zinit creinstall -q" \
		zinit light zsh-users/zsh-completions \
	

### End of Zinit's installer chunk
#}}}

