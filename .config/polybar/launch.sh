#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# This sets up each new instance of polybar with a different MONITOR environment variable
# for each execution
# Might be useful in the future to parameterize monitor setting in polybar config
# for m in $(polybar --list-monitors | cut -d":" -f1); do -> outputs 'eDP-1' while just on laptop
#     if (monitor is internal laptop screen i.e. HiDPI
#     if (monitor is landscape orientation):
#       MONITOR=$m polybar --reload main &
#     else (monitor is external i.e. standard DPI, irrelvant if it is portrait)
#       MONITOR=$m polybar --reload portrait &
# done


# Launch bars
polybar -q main &
polybar -q external &
polybar -q external-vertical &
polybar -q external-vertical-work &

echo "Bars launched..."
