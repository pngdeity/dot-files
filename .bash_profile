#
# ~/.bash_profile
#
# This file is only sourced by login shells.
# See the Arch Wiki article on Bash, subheading Invocation.

# Implement user directories for the XDG Base Directory Specification
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Default programs
export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/firefox-nightly

# Add system Golang path for user-level programs
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

# Manual application intervention for XDG Base Directory Specification compliance
# Source: Arch Wiki on XDG Base Directory
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
# export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

# Vim environment variables
export MYVIMRC="/home/nathan/.config/nvim/init.vim"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# This silences startx messages on bootup, stopping pollution in the login tty
# [[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null

[[ -f ~/.bashrc ]] && . ~/.bashrc
