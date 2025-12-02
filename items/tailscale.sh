#!/usr/bin/env bash

sketchybar --add item tailscale right \
           --set tailscale update_freq=30 script="$PLUGIN_DIR/tailscale.sh" \
           --set tailscale icon.drawing=off \
           --set tailscale padding_right=20 \
		   --set tailscale label.padding_left=5 label.padding_right=5 \
           --subscribe tailscale mouse.clicked mouse.entered
