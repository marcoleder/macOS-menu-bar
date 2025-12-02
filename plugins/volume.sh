#!/usr/bin/env bash

source "$HOME/.config/sketchybar/icons.sh"
if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"

  case "$VOLUME" in
	9[0-9]|100) ICON=$VOLUME_FULL
	;;
	[6-8][0-9]) ICON=$VOLUME_75
	;;
	[4-5][0-9]) ICON=$VOLUME_50
	;;
	[2-3][0-9]) ICON=$VOLUME_25
	;;
	1[0-9]) ICON=$VOLUME_0
	;;
	*) ICON=$VOLUME_MUTE
  esac

  sketchybar --set "$NAME" label="$VOLUME% $ICON" icon.drawing=off
fi
