import Data.List
import qualified Data.Map as M
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)

main = xmonad $ defaultConfig
         { modMask = mod4Mask
         , terminal = "gnome-terminal"
         , focusedBorderColor = "#000000"
         }  `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_l), spawn "xscreensaver-command -lock")
        ]
