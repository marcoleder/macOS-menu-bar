#!/usr/bin/env bash

update() {
	source "$HOME/.config/sketchybar/icons.sh"
	DNS_IP=$(scutil --dns | awk '/nameserver\[0\]/{print $3;exit}')

	case ${DNS_IP} in
  		100.100.100.100) ICON=$DNS_TAILSCALE
  		;;
  		*.*.*.*) ICON=$DNS_DIFFERENT
  		;;
  		*) ICON=$DNS_OFFLINE
	esac

	sketchybar --set tailscale label="$ICON" icon.drawing=off
}

mouse_clicked() {
	if [ "$BUTTON" = "left" ]; then
		tailscale up --accept-routes --exit-node=ch-zrh-wg-002.mullvad.ts.net --exit-node-allow-lan-access
		update
	else
		tailscale down
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
