#!/bin/bash

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# Here i3 is kept as a default
SESSION=${1:-i3}

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

get_session(){
	local dbus_args=(--sh-syntax --exit-with-session)
	case "$SESSION" in
		awesome) dbus_args+=(awesome) ;;
		bspwm) dbus_args+=(bspwm-session) ;;
		budgie) dbus_args+=(budgie-desktop) ;;
		cinnamon) dbus_args+=(cinnamon-session) ;;
		deepin) dbus_args+=(startdde) ;;
		enlightenment) dbus_args+=(enlightenment_start) ;;
		fluxbox) dbus_args+=(startfluxbox) ;;
		gnome) dbus_args+=(gnome-session) ;;
		i3|i3wm) dbus_args+=(i3 --shmlog-size 0) ;;
		jwm) dbus_args+=(jwm) ;;
		kde) dbus_args+=(startkde) ;;
		lxde) dbus_args+=(startlxde) ;;
		lxqt) dbus_args+=(lxqt-session) ;;
		mate) dbus_args+=(mate-session) ;;
		xfce) dbus_args+=(xfce4-session) ;;
		openbox) dbus_args+=(openbox-session) ;;
		*) dbus_args+=("$SESSION") ;;
	esac

	echo "dbus-launch ${dbus_args[*]}"
}

# No keyboard beeping
exec xset -b

# The following line restores the previously used colorscheme
# but does not alter the background.
exec wal -n -R 

# this file is not run with root privileges, just an FYI

# This checks whether I am in range of IllinoisNet wifi
# and then starts a systemd unit file to automatically
# connect to IllinoisNet
# it currently does not work, because netctl requires root privileges.
#exec nmcli dev wifi list > /home/nathan/Downloads/wifi.txt

#if grep -q "IllinoisNet" /home/nathan/Downloads/wifi.txt ; then
	#exec netctl start IllinoisNet
	#echo "Netctl profile IllinoisNet started" >> /home/nathan/Downloads/wifi.txt
#else
	#echo "Netctl profile IllinoisNet NOT started" >> /home/nathan/Downloads/wifi.txt
#fi

# turn on numlock
numlockx &

exec $(get_session)
