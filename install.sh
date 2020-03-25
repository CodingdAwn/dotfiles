#!/bin/bash

dot_file_dir="~/dotfiles"

[ ! -d "$dot_file_dir" ] && mkdir -p "$dot_file_dir"

# 创建链接
ln -s -f $dot_file_dir/.tmux.conf.local ~/
