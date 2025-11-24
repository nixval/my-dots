#!/usr/bin/env bash
# Usage: screenshot.sh [region|full]

MODE="$1"
DIR="$HOME/Pictures/Screenshots"
FILE="Screenshot_$(date +%Y%m%d_%H%M%S).png"

mkdir -p "$DIR"

if [ "$MODE" == "region" ]; then
    grim -g "$(slurp)" "$DIR/$FILE"
    # Copy to clipboard as well
    wl-copy < "$DIR/$FILE"
    notify-send "Screenshot" "Region saved to $DIR/$FILE" -i "$DIR/$FILE"
else
    grim "$DIR/$FILE"
    wl-copy < "$DIR/$FILE"
    notify-send "Screenshot" "Fullscreen saved to $DIR/$FILE" -i "$DIR/$FILE"
fi
