#!/bin/bash
# -i 代表忽略大小写 (JPG/jpg 都能匹配)
IMG=$(find ~/Pictures/Wallpaper-Bank/wallpapers/ -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | shuf -n 1)

# 获取图片长宽比 (需要 imagemagick)
# 如果不想麻烦，直接统一用 --bg-fill
feh --bg-fill "$IMG"
echo "$IMG" > ~/.cache/current_wallpaper
