#!/bin/bash

xmodmap -e "clear Lock"
xmodmap -e "keycode 66 = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Escape"
