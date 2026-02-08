#!/bin/bash
if [[ $1 != '+' && $1 != '-' ]]; then
  exit 1
fi

pactl set-sink-volume @DEFAULT_SINK@ "${1}""2%"

# get default sink
default_sink=$(pactl get-default-sink 2>/dev/null)
if [[ -z "$default_sink" ]]; then
    notify-send -u critical "pactl error" "default sink not found"
    echo -e "error：default sink not found " >&2
    exit 1
fi

# set sink volume
vol=$(pactl get-sink-volume ${default_sink} | awk -F'[/%]' '{print $2}' | tr -d ' ')

# notify to dunst the volume info
notify-send -h "int:value:${vol}" "Volume: ${vol}"
