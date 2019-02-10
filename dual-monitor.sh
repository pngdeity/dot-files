#!/bin/sh

# This script configures my external monitor using the xrandr (X Resize and Rotate) utility, as well as properly setting and scaling the previously used background image and polybar instance.

# TODO
# Ask for input on stdin for what backlight brightness for Logitech G610 mechanical keyboard.

xrandr --output DP1 --right-of eDP1
xrandr --output DP1 --scale 2x2
. ~/.config/polybar/launch.sh
. ~/.fehbg
g610-led -a 10
