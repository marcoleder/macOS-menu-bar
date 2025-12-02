#!/usr/bin/env bash

update() {
  source "$HOME/.config/sketchybar/colors.sh"
  local brightness=$(betterdisplaycli --displayWithMouse get --brightness)
  local brightness_percent=$(echo "$brightness * 100" | bc | cut -d. -f1)
  sketchybar --trigger brightness_change INFO=$brightness_percent
  if [ "$SELECTED" = "true" ]; then
      sketchybar --set $NAME icon.font="Hack Nerd Font:Bold:14.0" icon.highlight=$SELECTED background.color=0x000000
  else
      sketchybar --set $NAME icon.font="Hack Nerd Font:Bold:10.0" icon.highlight=$SELECTED background.color=0x000000
  fi
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    yabai -m space --destroy $SID
    sketchybar --trigger windows_on_spaces --trigger space_change
  elif [ "$BUTTON" = "left" ]; then
    yabai -m space --focus $SID 2>/dev/null
  else
    yabai -m space --create
  fi
}

case "$SENDER" in
  "mouse.entered") mouse_entered
  ;;
  "mouse.exited") mouse_exited
  ;;
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
