#!/bin/bash
if [[ $1 != '+' && $1 != '-' ]]; then
  exit
fi

pactl set-sink-volume @DEFAULT_SINK@ "${1}""2%"

# get default sink
default_sink=$(pactl get-default-sink)

# set sink volume
vol=$(pactl get-sink-volume ${default_sink} | awk -F'[/%]' '{print $2}' | tr -d ' ')

# notify to dunst the volume info
notify-send -h "int:value:${vol}" "Volume: ${vol}"
