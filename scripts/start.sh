#!/bin/bash

xrdb -merge ~/.Xresources &
xrandr --output eDP1 --auto --primary --output HDMI-1-0 --auto --right-of eDP1

# 基础环境
picom -b --config ~/.config/picom/picom.conf
fcitx5 -d
clash-verge &

# 随机桌面
while true; do
    feh --bg-max --recursive --randomize ~/Pictures/feh_wallpapers/
    sleep 600
done &

# 其他应用
dwmblocks &
dunst &
xset s 6000 6000
xset dpms 0 0 6000
xss-lock -- slock &

# mpc监听切歌事件
mpc_listener.sh &
