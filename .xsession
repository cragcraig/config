#!/bin/sh
. ~/.profile

google-chrome&
gnome-terminal&

# Remap esc to caps lock
xmodmap -e "clear Lock"
xmodmap -e "keycode 66 = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Escape"

xmonad
