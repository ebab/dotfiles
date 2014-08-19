--
-- An example, simple ~/.xmonad/xmonad.hs file.
-- It overrides a few basic settings, reusing all the other defaults.
--

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders 

main = do
    xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main configuration, override the defaults to your liking.
myConfig = defaultConfig
        { borderWidth        = 1
        , terminal           = "urxvt"
        , normalBorderColor  = "#222222"
        , focusedBorderColor = "#444444"
        , manageHook = (className =? "mpv" --> doFloat) <+> (isFullscreen --> doFullFloat) <+> manageHook defaultConfig
        , layoutHook = smartBorders $ layoutHook defaultConfig
        , modMask            = mod4Mask
        }
        `additionalKeysP`
        [ ("M-<Return>", spawn (terminal myConfig))
        , ("M-<Backspace>", kill)
        , ("<Print>", spawn "gnome-screenshot")
        , ("<XF86AudioLowerVolume>", spawn "ponymix decrease 5")
        , ("<XF86AudioRaiseVolume>", spawn "ponymix increase 5")
        , ("<XF86AudioMute>", spawn "ponymix toggle")
        , ("M-<KP_Subtract>", spawn "ponymix decrease 5")
        , ("M-<KP_Add>", spawn "ponymix increase 5")
        , ("M-<KP_Multiply>", spawn "ponymix increase 5")
        ]
        `removeKeysP`
        [ ("M-S-<Return>")
        , ("M-S-c")
        ]
