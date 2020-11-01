# This file is only source by login shells.
# See the Arch Wiki article on Bash, subheading Invocation.

export EDITOR="/usr/bin/vim"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export VIMINIT='source "$XDG_CONFIG_HOME/vim/vimrc"'
PATH=$PATH:~/.local/bin
