#!/bin/sh


# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

if ! [[ "$PATH" =~ "$HOME/.cargo/bin:" ]]
then
    PATH="$HOME/.cargo/bin:$PATH"
fi

if ! [[ "$PATH" =~ "/usr/lib/qt6/bin" ]]
then
        PATH="/usr/lib/qt6/bin:$PATH"
fi
export PATH
