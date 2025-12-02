#!/usr/bin/env bash

source "$HOME/.config/sketchybar/icons.sh"
PERCENTAGE=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{print 100-$5"%"}')

case ${PERCENTAGE} in
  9[0-9]|100) ICON=$RAM_FULL
  ;;
  [6-8][0-9]) ICON=$RAM_75
  ;;
  [3-5][0-9]) ICON=$RAM_50
  ;;
  [1-2][0-9]) ICON=$RAM_25
  ;;
  *) ICON=$RAM_25
esac

sketchybar --set ram label="${PERCENTAGE} $ICON" icon.drawing=off
