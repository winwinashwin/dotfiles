#!/bin/bash

TERM_PID="$(ps -C alacritty -o pid:1=)"

if [[ -z "$TERM_PID" ]]; then
    exec alacritty -e tmux -u
else
    xdotool windowactivate `xdotool search --pid $TERM_PID`
fi

