#!/usr/bin/env bash

sketchybar --add event aerospace_workspace_change

mapfile -t SPACE_ICONS < <(aerospace list-workspaces --all)

for i in "${!SPACE_ICONS[@]}"; do
  workspace_name="${SPACE_ICONS[i]}"

  # Use --add item instead of --add space
  sketchybar --add item space.$workspace_name left \
    --subscribe space.$workspace_name aerospace_workspace_change \
    --set space.$workspace_name \
      icon="$workspace_name" \
      icon.font="Hack Nerd Font:Bold:10.0" \
      width=40 \
      align=center \
      icon.highlight_color=$RED \
      click_script="aerospace workspace $workspace_name" \
      script="$PLUGIN_DIR/aerospace.sh $workspace_name"
done
