#!/bin/sh

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

alias :q=exit
alias cls=clear
alias :e=vim
alias nn=nvim
alias tk=task
alias lc=lfcd
alias sk=taskwarrior-tui

export FONTCONFIG_PATH=/etc/fonts/
export LC_CTYPE="en_IN.utf8"
export SDKMAN_DIR="$HOME/.sdkman"
export AMD_VULKAN_ICD=RADV
export BROWSER=brave
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export LC_CTYPE="en_IN.utf8"
export EDITOR=vim
export VISUAL=nvim
export HISTIGNORE='ls:cls:\:q:\:e:lf:lc:pwd'
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="/usr/x86_64-w64-mingw32/bin:$PATH"
export PATH="$HOME/.config/nvim/scripts:$PATH"
export PATH="$HOME/.luarocks/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
