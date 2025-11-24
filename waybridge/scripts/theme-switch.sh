#!/usr/bin/env bash

# -----------------------------------------------------
# THEME SWITCHER
# -----------------------------------------------------
# Usage: ./theme-switch.sh /path/to/image.png
# -----------------------------------------------------

WALLPAPER="$1"

if [ -z "$WALLPAPER" ]; then
    echo "Error: No wallpaper provided."
    exit 1
fi

echo ":: Setting wallpaper to $WALLPAPER..."

# 1. Apply Wallpaper (Hyprpaper)
# We need to unload old ones to save ram, then preload new one
# Note: This is a simplified implementation. 
# Ideally, check if hyprpaper is running.
hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper ",$WALLPAPER"

# 2. Generate Colors (Matugen)
# We explicitly point to our waybridge config
echo ":: Generating colors..."
matugen image "$WALLPAPER" --config ~/.config/waybridge/matugen/config.toml

# 3. Reload Apps
echo ":: Reloading applications..."

# Hyprland (Reload config to pick up new colors)
hyprctl reload

# Waybar (Restart to recolor)
pkill waybar && waybar -c ~/.config/waybridge/waybar/config.jsonc -s ~/.config/waybridge/waybar/style.css &

# Kitty (Live reload via signal)
# Requires 'listen_on' in kitty.conf
pkill -SIGUSR1 kitty

# SwayNC (Reload css)
swaync-client -R
swaync-client -rs

echo ":: Theme switch complete."
