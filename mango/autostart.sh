#!/usr/bin/env sh
#
# [INFO] Startup script for Mangowc.
# This script is executed on launch.
# [CITE] liyankova/llmstxt-linux/llmstxt-linux-2029d8729bffe932312019d0dedd5a3cfd9c639b/wm/mangowc-wiki/Home.md

# [ACTION] Define your preferred daemons here.
POLKIT_AGENT="/usr/lib/hyprpolkitagent"
NOTIFICATION_DAEMON="swaync"
WALLPAPER_CMD="swaybg -i /path/to/wall.png"
STATUS_BAR="waybar"
CLIPBOARD_MANAGER_TEXT="wl-paste --type text --watch cliphist store"
CLIPBOARD_PERSIST="wl-clip-persist --clipboard regular"

# [INFO] Launch Daemons
$POLKIT_AGENT &
$NOTIFICATION_DAEMON &
$WALLPAPER_CMD &
$STATUS_BAR &
$CLIPBOARD_MANAGER_TEXT &
$CLIPBOARD_PERSIST &

# [INFO] Update D-Bus environment
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
