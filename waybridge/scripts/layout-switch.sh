#!/usr/bin/env bash
# Toggles between master and dwindle layout

CURRENT_LAYOUT=$(hyprctl -j getoption general:layout | jq -r '.str')

if [ "$CURRENT_LAYOUT" = "dwindle" ]; then
    hyprctl keyword general:layout "master"
    notify-send "Layout" "Switched to Master"
else
    hyprctl keyword general:layout "dwindle"
    notify-send "Layout" "Switched to Dwindle"
fi
