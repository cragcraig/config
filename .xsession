#!/bin/sh
. ~/.profile

xscreensaver&
google-chrome&
gnome-terminal&

# Remap esc to caps lock
xmodmap -e "clear Lock"
xmodmap -e "keycode 66 = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Escape"

# Set mouse acceleration
xset m 5/2 0

exec xmonad
