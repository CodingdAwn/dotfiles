#!/bin/bash

case "$1" in
  "togglepause") rmpc togglepause ;;
  "next") rmpc next ;;
  "prev") rmpc prev ;;
  *) echo "Usage: $0 [togglepause|next|prev]" ; exit 1;;
esac 

# 通知dwmblocks
pkill -RTMIN+10 dwmblocks
