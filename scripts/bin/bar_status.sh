#!/bin/bash

cpu_temp=$(sensors | awk '/^Package/ { print $4 }' | sed 's/[+C]//g')
gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
mem_use=$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)
#cpu_use=$(mpstat | awk '/all/ { printf "%.1f", 100-$13 }')

#echo "CPU:${cpu_use}%-${cpu_temp} | GPU:${gpu_temp}° | Mem:${mem_use} "
echo "CPU:${cpu_temp} | GPU:${gpu_temp}° | Mem:${mem_use}"

