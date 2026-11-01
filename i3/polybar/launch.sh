#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch a bar on each connected output
echo "---" | tee -a /tmp/polybar.log
while IFS=: read -r monitor _; do
  MONITOR="$monitor" polybar --config="$HOME/.config/polybar/config.ini" main 2>&1 | tee -a /tmp/polybar.log & disown
done < <(polybar --list-monitors)
echo "Bars launched..."
