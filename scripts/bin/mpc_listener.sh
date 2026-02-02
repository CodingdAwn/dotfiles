#!/bin/bash
mpc idleloop player | while read -r event; do
    # 每当监听到 player 事件，就给 dwmblocks 发送信号更新状态栏
    pkill -RTMIN+10 dwmblocks
done
