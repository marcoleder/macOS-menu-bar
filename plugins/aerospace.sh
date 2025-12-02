#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME icon.font="Hack Nerd Font:Bold:14.0" icon.highlight=true background.color=0x000000
else
    sketchybar --set $NAME icon.font="Hack Nerd Font:Bold:10.0" icon.highlight=false background.color=0x000000
fi
