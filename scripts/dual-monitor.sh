#!/bin/sh

# This script configures my external monitor using the xrandr (X Resize and Rotate) utility, as well as properly setting and scaling the previously used background image and polybar instance.

# TODO
# Ask for input on stdin for what backlight brightness for Logitech G610 mechanical keyboard.
# Consider using this script as a compelement to the one-monitor.sh, i.e. turn the internal laptop screen back on

xrandr --output DP1 --right-of eDP1
xrandr --output DP1 --scale 2x2
. ~/.config/polybar/launch.sh
. ~/github/customization-automation/wal.sh
g610-led -a 10
xset -b
