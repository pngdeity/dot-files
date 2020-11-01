#!/bin/bash

# This script is to turn off the built-in laptop monitor when an external
# monitor is attached. This saves battery power, I presume.
# TODO: Put in a safety check to make sure an external monitor is plugged-in,
# so you cannot accidentally run this without an external monitor and be left
# without a screen to run commands.
# Grab the external monitor and built-in monitor display

xrandr --output DP1 --primary
xrandr --output DP1 --scale 2x2
xrandr --output eDP1 --left-of DP1 # why set eDP1 to be left-of, when it will be turned off?
. ~/.config/polybar/launch.sh
xrandr --output eDP1 --off
. ~/github/customization-automation/wal.sh
xset -b
g610-led -a 10
