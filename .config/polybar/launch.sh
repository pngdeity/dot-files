#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

IFS=$'\n'

for textoutput in $(polybar --list-monitors)
do
    MYMONITOR=$(echo $textoutput | cut -d":" -f1)
    WIDTH=$(echo $textoutput | cut -d" " -f2 | cut -d"x" -f1)
    HEIGHT=$(echo $textoutput | cut -d" " -f2 | cut -d"x" -f2 | cut -d"+" -f1)
    DIFF=$((WIDTH-HEIGHT))
    if [ $DIFF -gt 0 ]
    then
        # echo "LANDSCAPE"
        MONITOR=$MYMONITOR polybar -q main &
    else
        # echo "PORTRAIT"
        MONITOR=$MYMONITOR polybar -q portrait &
    fi
done

unset IFS

echo "Bars launched..."
