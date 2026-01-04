#!/bin/bash

ACTION=$1
STEP=${2:-5}

case $ACTION in
    up)
        pactl set-sink-volume @DEFAULT_SINK@ +${STEP}%
        ;;
    down)
        pactl set-sink-volume @DEFAULT_SINK@ -${STEP}%
        ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
    *)
        echo "用法: $0 [up|down|mute] [step]"
        exit 1
        ;;
esac

# 等待音量变化生效
sleep 0.1

# 获取音量信息
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -1)
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o "yes")

# 创建进度条
BAR_WIDTH=20
FILLED=$((VOLUME * BAR_WIDTH / 100))
EMPTY=$((BAR_WIDTH - FILLED))

BAR="["
for ((i=0; i<FILLED; i++)); do BAR+="█"; done
for ((i=0; i<EMPTY; i++)); do BAR+="░"; done
BAR+="]"

# 根据状态选择图标
if [[ -n "$MUTE" ]]; then
    ICON="🔇"
    TEXT="静音"
elif [[ $VOLUME -eq 0 ]]; then
    ICON="🔇"
    TEXT="0%"
elif [[ $VOLUME -lt 30 ]]; then
    ICON="🔈"
    TEXT="${VOLUME}%"
elif [[ $VOLUME -lt 70 ]]; then
    ICON="🔉"
    TEXT="${VOLUME}%"
else
    ICON="🔊"
    TEXT="${VOLUME}%"
fi

# 显示通知
if command -v dunstify &> /dev/null; then
    dunstify -t 1000 -r 9999 -u low \
        "$ICON $TEXT" \
        "$BAR" \
        -h "int:value:$VOLUME"
elif command -v notify-send &> /dev/null; then
    notify-send -t 1000 -h string:x-canonical-private-synchronous:volume \
        "$ICON $TEXT" \
        "$BAR" \
        -h "int:value:$VOLUME"
fi
