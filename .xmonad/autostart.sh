#!/bin/sh
picom &
nitrogen --restore &
discord &
xrandr --output DisplayPort-0 --mode 1920x1080 --rate 144 --primary --left-of DisplayPort-2 --output DisplayPort-2 --mode 1920x1080 --rate 144 &
xsetroot -cursor_name left_ptr &
xrdb ~/.Xresources &
trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true     --monitor 0 --transparent true --alpha 0 --tint 0x313c4f --height 22 &
