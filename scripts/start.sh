#!/bin/bash

xrdb -merge ~/.Xresources &
xrandr --output eDP1 --auto --primary --output HDMI-1-0 --auto --right-of eDP1

# 基础环境
picom -b --config ~/.config/picom/picom.conf
fcitx5 -d
clash-verge &

# 随机桌面
while true; do
    feh --bg-fill --recursive --randomize ~/Pictures/
    sleep 300
done &

# 其他应用
## 状态栏
dwmblocks &
## music player
#rmpc &
