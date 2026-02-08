#!/bin/bash

case "$1" in
  "togglepause") rmpc togglepause ;;
  "next") rmpc next ;;
  "prev") rmpc prev ;;
  *) echo "Usage: $0 [togglepause|next|prev]" ; exit 1;;
esac 

# 通知dwmblocks
# 不应该通知了，因为又做了一个mpc_listener.sh来监视切歌
#pkill -RTMIN+10 dwmblocks
