#!/usr/bin/env bash

sketchybar --add item ram right \
           --set ram update_freq=60 script="$PLUGIN_DIR/ram.sh" \
           --set ram icon.drawing=off \
           --set ram padding_right=20 \
           --set ram label.padding_left=5 label.padding_right=5
