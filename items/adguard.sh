#!/usr/bin/env bash

sketchybar  --add item adguard right \
            --set adguard update_freq=30  script="$PLUGIN_DIR/adguard.sh" \
            --set adguard icon.drawing=off \
            --set adguard padding_right=20 \
            --set adguard label.padding_left=5 label.padding_right=5 \
            --subscribe adguard mouse.clicked mouse.entered
