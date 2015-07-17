import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog
import XMonad.Actions.GridSelect
import XMonad.Layout.NoBorders 
import XMonad.Util.SpawnOnce
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops (ewmh)
import System.Taffybar.Hooks.PagerHints (pagerHints)
import System.IO
import XMonad.Hooks.EwmhDesktops

main = xmonad $ ewmh myConfig

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

pp = defaultPP

myConfig = defaultConfig
        { borderWidth        = 1
        , terminal           = "urxvt"
        , normalBorderColor  = "#333333"
        , focusedBorderColor = "#444444"
        , workspaces         = ["α","β","γ","δ","ε","ζ","η","θ","ι"]
        , manageHook = manageDocks <+> (isFullscreen --> doFullFloat) <+> manageHook defaultConfig
        , layoutHook = smartBorders $ avoidStruts $ layoutHook defaultConfig
        , startupHook = setWMName "LG3D" <+> spawnOnce "taffybar"
        , modMask = mod4Mask
        , handleEventHook = fullscreenEventHook <+> docksEventHook
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
        , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 10")
        , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 10")
        , ("M-p", spawn "dmenu_run -fn 'DejaVu Sans Mono-16'")
        , ("M-b", sendMessage ToggleStruts )
        , ("M-n", spawnSelected defaultGSConfig ["firefox"])
        ]
        `removeKeysP`
        [ ("M-S-<Return>")
        , ("M-S-c")
        ]
