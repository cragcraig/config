# Use xmonad as the window manager
xmonad --replace &

# Use a compositior that works around an OpenGL bug in NVIDIA drivers
xcompmgr -a &

# Remap esc to caps lock
xmodmap -e "clear Lock"
xmodmap -e "keycode 66 = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Escape"

# Un-mute sound
amixer -D pulse set Master toggle
