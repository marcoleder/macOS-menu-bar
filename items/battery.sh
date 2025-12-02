#!/usr/bin/env bash

sketchybar --add item battery right \
           --set battery update_freq=10 script="$PLUGIN_DIR/battery.sh" \
           --set battery icon.drawing=off \
           --set battery padding_right=20 \
           --set battery label.padding_left=5 label.padding_right=5
