#!/usr/bin/env bash

SPACE_ICONS=("1" "2" "3" "4")

sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))

  space=(
    associated_space=$sid
    icon="${SPACE_ICONS[i]}"
    icon.font="Hack Nerd Font:Bold:10.0"
    width=18
    align=center
    icon.highlight_color=$RED
    script="$PLUGIN_DIR/space.sh"
  )

  sketchybar --add space space.$sid left    \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid mouse.clicked
done