#!/usr/bin/env bash

sketchybar --add item docker right \
           --set docker update_freq=15 script="$PLUGIN_DIR/docker.sh" \
           --set docker icon.drawing=off \
           --set docker padding_right=20 \
           --set docker label.padding_left=5 label.padding_right=5 \
           --subscribe docker mouse.clicked mouse.entered
