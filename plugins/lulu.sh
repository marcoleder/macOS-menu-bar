#!/usr/bin/env bash

update() {
	source "$HOME/.config/sketchybar/icons.sh"
	# 0 and 1 is confusing, becuase state is DISABLED which we query just FYI
	STATUS=$(defaults read /Library/Objective-See/LuLu/preferences.plist disabled)

	case ${STATUS} in
  		1) ICON=$LULU_OFF
  		;;
  		0) ICON=$LULU_ON
  		;;
  		*) ICON=$LULU_UNKNOWN
	esac

	sketchybar --set lulu label="$ICON" icon.drawing=off
}

mouse_clicked() {
	if [ "$BUTTON" = "left" ]; then  
		update
	else
		update
	fi
}

case "$SENDER" in
  "mouse.entered") update
  ;;
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
