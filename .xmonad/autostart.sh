#!/bin/sh
picom &
nitrogen --restore
xrandr --output DisplayPort-0 --mode 1920x1080 --rate 144 --primary --left-of DisplayPort-2 --output DisplayPort-2 --mode 1920x1080 --rate 144 &
xsetroot -cursor_name left_ptr &
xrdb ~/.Xresources &
trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true     --monitor 0 --transparent true --alpha 0 --tint 0x76d2fc --height 22 &
# Launch xmobar via autostart since xmproc caused me weird freezing errors and I don't need xmonad information in xmobar
xmobar -x 0 /home/jo/.config/xmobar/xmobarrc0 &
xmobar -x 1 /home/jo/.config/xmobar/xmobarrc0 &
