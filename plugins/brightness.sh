#!/usr/bin/env bash
source "$HOME/.config/sketchybar/icons.sh"
source "$HOME/.config/sketchybar/colors.sh"

BRIGHTNESS=""
COLOR="$WHITE"

# Check for the bridge event
if [ "$SENDER" = "bd_update" ]; then
  if echo "$INFO" | grep -q "Brightness"; then
    
    # Extract data (tr -d handles potential formatting issues)
    VAL=$(echo "$INFO" | jq -r '.value' | tr -d '\n"')
    MAX=$(echo "$INFO" | jq -r '.maxValue' | tr -d '\n"')
    TARGET=$(echo "$INFO" | jq -r '.controlTarget' | tr -d '\n"')

    if [ -n "$VAL" ] && [ -n "$MAX" ] && [ "$MAX" != "0" ]; then
      if [ "$TARGET" = "hardwareBrightness" ]; then
        # XDR Logic: Map 0-64 -> 0-160%
        BRIGHTNESS=$(echo "scale=0; ($VAL * 160) / $MAX" | bc)
      else 
        # Standard Logic: Map 0-64 -> 0-100%
        BRIGHTNESS=$(echo "scale=0; ($VAL * 100) / $MAX" | bc)
      fi
    fi
  fi

elif [ "$SENDER" = "custom_brightness_change" ] || [ "$SENDER" = "brightness_change" ]; then
  # Standard events just send the number directly
  BRIGHTNESS="$INFO"
fi

if [ -n "$BRIGHTNESS" ]; then
  if [ "$BRIGHTNESS" -gt 100 ]; then
    ICON="$BRIGHTNESS_XDR"
    COLOR="$RED"
  else
    case "$BRIGHTNESS" in
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
  fi
  sketchybar --set "$NAME" label="$ICON $BRIGHTNESS%" label.color="$COLOR" icon.drawing=off
fi
