#!/usr/bin/env bash

update() {
	source "$HOME/.config/sketchybar/icons.sh"
	STATUS=$(defaults read com.adguard.mac.adguard FilteringEnabled)

	case ${STATUS} in
  		0) ICON=$ADGUARD_OFF
  		;;
  		1) ICON=$ADGUARD_ON
  		;;
  		*) ICON=$ADGUARD_UNKNOWN
	esac

	sketchybar --set adguard label="$ICON" icon.drawing=off
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
