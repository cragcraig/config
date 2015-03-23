import XMonad
 
main = xmonad defaultConfig
         { modMask = mod4Mask
         , terminal = "urxvt"
         , focusedBorderColor = "#000000"
         }
