#!/bin/sh

# This script gathers the various configuration files littered around my machine into
# my github repo

# An explanation:
# \cp - run the cp command without any aliasing
# -u - only execute the command if the copied files are newer
# -r - recursively add the directory argument(s)

\cp -u ~/.bashrc ~/.vimrc ~/.Xresources ~/.xinitrc ~/github/dot-files/
\cp -ru ~/.config/i3/ ~/.config/polybar ~/github/dot-files/
