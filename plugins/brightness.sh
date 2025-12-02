#!/usr/bin/env bash

source "$HOME/.config/sketchybar/icons.sh"
if [ "$SENDER" = "custom_brightness_change" ]; then
  BRIGHTNESS="$INFO"

  case "$BRIGHTNESS" in
  	10[1-9]|1[1-9][0-9]) ICON=$BRIGHTNESS_XDR  	
	;;
	[8-9][0-9]|100) ICON=$BRIGHTNESS_FULL
	;;
	[5-7][0-9]) ICON=$BRIGHTNESS_75
	;;
	[2-4][0-9]) ICON=$BRIGHTNESS_50
	;;
	[0-1][0-9]) ICON=$BRIGHTNESS_25
	;;
	*) ICON=$BRIGHTNESS_0
  esac

  sketchybar --set "$NAME" label="$ICON $BRIGHTNESS%" icon.drawing=off
fi
