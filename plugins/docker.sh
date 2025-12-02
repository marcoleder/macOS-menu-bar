#!/usr/bin/env bash

DOCKER_CMD="/usr/local/bin/docker"
OSASCRIPT_CMD="/usr/bin/osascript"

update() {
    source "$HOME/.config/sketchybar/icons.sh"

    # Check for Docker binary first
    if [[ ! -x "$DOCKER_CMD" ]]; then
        sketchybar --set docker label="ERROR" icon.drawing=off
        return
    fi
    
    # Check if Docker daemon is running
    if "$DOCKER_CMD" version >/dev/null 2>&1; then
        CONTAINER_COUNT=$("$DOCKER_CMD" ps -q | wc -l | tr -d ' ')
        if [[ "$CONTAINER_COUNT" -gt 0 ]]; then
            ICON="$DOCKER_RUNNING"
        else
            ICON="$DOCKER_IDLE"
        fi
    else
        ICON="$DOCKER_OFFLINE"
    fi

    sketchybar --set docker label="$ICON" icon.drawing=off
}

mouse_clicked() {
	if [ "$BUTTON" = "left" ]; then
		open -a "Docker"
  		update
  	else
  		"$OSASCRIPT_CMD" -e 'tell application "Docker" to quit'
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
