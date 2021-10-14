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
### End of Zinit's installer chunk

# Required by OMZ
setopt promptsubst

bindkey -v
export KEYTIMEOUT=1

# Setup Git
zinit wait lucid for \
	OMZL::git.zsh \
	OMZP::git

#PS1="ちょっと待ってよ!"

# Setup theme
zinit wait"!" lucid for \
	light-mode OMZL::prompt_info_functions.zsh \
	light-mode OMZT::nanotech

zinit wait lucid for \
	light-mode zdharma/fast-syntax-highlighting \
	light-mode zdharma/history-search-multi-word \
	light-mode zsh-users/zsh-completions \
	light-mode zsh-users/zsh-autosuggestions

#source "$HOME/.bashrc"
source ~/.config/bash/tmux.sh
# source ~/.config/bash/ps1.sh
source ~/.config/bash/path.sh
# source ~/.config/bash/alias.sh
# source ~/.config/bash/nnn-config.sh
source ~/.config/bash/env.sh
