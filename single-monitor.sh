#!/bin/bash

# This script is to turn off the built-in laptop monitor when an external
# monitor is attached. This saves battery power, I presume.

xrandr --output DP1 --primary
xrandr --output DP1 --scale 2x2
xrandr --output eDP1 --left-of DP1
. ~/.config/polybar/launch.sh
xrandr --output eDP1 --off
. ~/.fehbg
xset -b
g610-led -a 10
