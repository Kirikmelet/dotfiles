# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
export PATH=$PATH:$HOME/.local/opt/dotbare:$HOME/.local/bin/

# User specific aliases and functions


# connect to tmux
cmux () {
    if command -v tmux >/dev/null 2>&1; then
        # if not inside a tmux session, and if no session is started, start a new session
        [ -z "${TMUX}" ] && (tmux new-session -A -s MAIN  >/dev/null 1>&1)
    fi
}

set -o vi
source "$HOME/.cargo/env"
