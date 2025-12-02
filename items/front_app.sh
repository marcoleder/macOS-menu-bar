#!/usr/bin/env bash

front_app=(
  script='sketchybar --set $NAME label="$INFO"'
  associated_display=active
  padding_left=12
)

sketchybar --add event window_focus            \
           --add event windows_on_spaces       \
           --add item front_app left           \
           --set front_app "${front_app[@]}"   \
		   --set front_app click_script="open -a Launchpad" \
           --subscribe front_app front_app_switched
