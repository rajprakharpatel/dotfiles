#!usr/bin bash

#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
