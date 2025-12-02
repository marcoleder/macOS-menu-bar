#!/usr/bin/env bash

sketchybar  --add item lulu right \
            --set lulu update_freq=30  script="$PLUGIN_DIR/lulu.sh" \
            --set lulu icon.drawing=off \
            --set lulu padding_right=20 \
            --set lulu label.padding_left=5 label.padding_right=5 \
            --subscribe lulu mouse.clicked mouse.entered
