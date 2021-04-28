#!/bin/sh

# connect to tmux
cmux () {
    if command -v tmux >/dev/null 2>&1; then
        # if not inside a tmux session, and if no session is started, start a new session
        [ -z "${TMUX}" ] && (tmux new-session -A -s MAIN  >/dev/null 1>&1)
    fi
}
