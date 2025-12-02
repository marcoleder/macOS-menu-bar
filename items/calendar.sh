#!/usr/bin/env bash

sketchybar --add item calendar right \
           --set calendar update_freq=30 script="$PLUGIN_DIR/calendar.sh" \
           --subscribe calendar system_woke
