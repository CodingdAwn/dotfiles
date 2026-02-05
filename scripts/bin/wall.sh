#!/bin/bash
# -i 代表忽略大小写 (JPG/jpg 都能匹配)
# todo 这个只能随机一张照片
#IMG=$(find ~/Pictures/ -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | shuf -n 1)

# 获取图片长宽比 (需要 imagemagick)
# 如果不想麻烦，直接统一用 --bg-fill
#feh --bg-max  "$IMG"
feh --bg-max --recursive --randomize ~/Pictures/feh_wallpapers/
echo "$IMG" > ~/.cache/current_wallpaper
