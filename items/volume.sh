#!/usr/bin/env bash

sketchybar --add item volume e \
           --set volume script="$PLUGIN_DIR/volume.sh" \
           --set volume icon.drawing=off \
           --subscribe volume volume_change