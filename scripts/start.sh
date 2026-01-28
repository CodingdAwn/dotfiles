#!/bin/bash

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus # 部分现代终端（如 kitty）需要这个

xrdb -merge ~/.Xresources &
xrandr --output eDP1 --auto --primary --output HDMI-1-0 --auto --right-of eDP1

# 基础环境
picom -b --config ~/.config/picom/picom.conf
fcitx5 -d &
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
rmpc &

## oh my dwm
exec dwm
