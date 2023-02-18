#!/bin/sh

path_ac="/sys/class/power_supply/ADP1"
path_battery_0="/sys/class/power_supply/BAT0"
path_battery_1="/sys/class/power_supply/BAT1"

voltageSymbol=$(echo -ne '\xE2\x9A\xA1')
batterySymbol=$(echo -ne '\xF0\x9F\x94\x8B')

ac=0
battery_level_0=0
battery_level_1=0
battery_max_0=0
battery_max_1=0

# -f tests if the file is a regular file
if [ -f "$path_ac/online" ]; then
    ac=$(cat "$path_ac/online")
fi

if [ -f "$path_battery_0/energy_now" ]; then
    battery_level_0=$(cat "$path_battery_0/energy_now")
fi

if [ -f "$path_battery_0/energy_full" ]; then
    battery_max_0=$(cat "$path_battery_0/energy_full")
fi

if [ -f "$path_battery_1/energy_now" ]; then
    battery_level_1=$(cat "$path_battery_1/energy_now")
fi

if [ -f "$path_battery_1/energy_full" ]; then
    battery_max_1=$(cat "$path_battery_1/energy_full")
fi

battery_level=$(("$battery_level_0 + $battery_level_1"))
battery_max=$(("$battery_max_0 + $battery_max_1"))

battery_percent=$(("$battery_level * 100"))
battery_percent=$(("$battery_percent / $battery_max"))

if [ "$ac" -eq 1 ]; then
    echo "${voltageSymbol}${battery_percent}%"

    # if [ "$battery_percent" -gt 97 ]; then
        # echo "$icon"
    # else
        # echo "$icon $battery_percent %"
    # fi
else
    echo "${batterySymbol}${battery_percent}%"
    # if [ "$battery_percent" -gt 85 ]; then
        # icon="#21"
    # elif [ "$battery_percent" -gt 60 ]; then
        # icon="#22"
    # elif [ "$battery_percent" -gt 35 ]; then
        # icon="#23"
    # elif [ "$battery_percent" -gt 10 ]; then
        # icon="#24"
    # else
        # icon="#25"
    # fi

    # echo "$icon $battery_percent %"
fi
