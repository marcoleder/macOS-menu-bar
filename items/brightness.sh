#!/usr/bin/env bash

sketchybar --add item brightness q \
           --set brightness script="$PLUGIN_DIR/brightness.sh" \
           --set brightness icon.drawing=off \
           --add event custom_brightness_change \
           --subscribe brightness custom_brightness_change
