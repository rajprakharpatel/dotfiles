#!/bin/sh

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . "$HOME/.xprofile"

xrandr --output HDMI-1-0 --mode 1366x768 --rate 60.00 --right-of eDP-1

exec awesome
