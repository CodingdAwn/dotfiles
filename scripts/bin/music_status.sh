#!/bin/bash

# 当前的歌曲，状态
cur_song=$(mpc current)

# 播放状态 [playing] or [paused]
state=$(mpc status | awk 'NR==2 { print $1 }')
if [[ "${state}" == "[playing]" ]]; then
  echo " ${cur_song}"
  notify-send -u normal -t 3000 "Now Playing" "${cur_song}"
elif [[ "${state}" == "[paused]" ]]; then
  echo " ${cur_song}"
  notify-send -u low -t 3000 "${cur_song}" "is Paused"
else
  echo "None"
fi
