#!/bin/bash

# This script is to turn off the built-in laptop monitor when an external
# monitor is attached. This saves battery power, I presume.

xrandr --output DP1 --primary
xrandr --output eDP1 --left-of DP1
xrandr --output eDP1 --off
# this line causes an error because launch.sh includes a call to 
# putting a polybar onto eDP1, which was just turned off
. ~/.config/polybar/launch.sh
. ~/.fehbg
xset -b
