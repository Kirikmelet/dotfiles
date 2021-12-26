#!/usr/bin/env sh

# Terminate already running bar instances
killall -q yambar

# Wait until the processes have been shut down
while pgrep -x yambar >/dev/null; do sleep 1; done

# Launch yambar
yambar &
