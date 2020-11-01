#!/bin/sh

# This script gathers the various configuration files littered around my machine into
# my GitHub repo

# TODO
# Write a script to gather a list of all files in the Github directory
# Add this list to an argument list that is automatically populated

# An explanation:
# \cp - run the cp command without any aliasing
# -u - only execute the command if the copied files are newer
# -r - recursively add the directory argument(s)

\cp -u ~/.bashrc ~/.Xresources ~/.xinitrc ~/github/dot-files
\cp -u ~/scripts/dual-monitor.sh ~/scripts/single-monitor.sh ~/github/dot-files/scripts
\cp -u ~/.config/vim/vimrc ~/github/dot-files/.config/vim
\cp -ru ~/.config/i3/ ~/.config/polybar ~/github/dot-files/.config
