#!/bin/bash

# set path
dot_file_dir=~/dotfiles
home_dir=~/
tmux_dir=~/.tmux
echo "dot file dir is $dot_file_dir"
echo "home dir is $home_dir"

#install tmux
[ ! -d $dot_file_dir ] &&
  git clone https://github.com/gpakosz/.tmux.git $home_dir/

# 创建链接
ln -s -f $tmux_dir/.tmux.conf $home_dir/
# 复制local配置到home
cp -f $tmux_dir/.tmux.conf.local $home_dir/
# 使用自己的conf
echo "source-file $dot_file_dir/tmux.conf.myself" >> $home_dir/.tmux.conf.local

