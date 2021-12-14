#!/bin/bash

##################################################
## TODO
## 1. 考虑系统的问题 mac linux windows/wsl
## 2. 考虑已安装的soft如何检测 可以在任何时候调用脚本 增量安装未安装的soft
## 3. 解决一些bug 我记得只能在dotfiles目录执行此脚本 否则路径不对
## 4. add soft [ ranger, lazygit ]
##################################################

# set path
dot_file_dir=~/dotfiles
home_dir=~/
github_repo_dir=~/github_repo
tmux_dir=$github_repo_dir/tmux
echo "dot file dir is $dot_file_dir"
echo "home dir is $home_dir"
echo "github repository dir is $github_repo_dir"
echo "tmux dir is $tmux_dir"

# clean files
rm -f "$home_dir/.tmux.conf"
rm -f "$home_dir/.tmux.conf.local"

# set tmux repository url
tmux_github_url="https://github.com/gpakosz/.tmux.git"
#install tmux
[ ! -d "$github_repo_dir" ] && mkdir -p $github_repo_dir && git clone "$tmux_github_url" "$tmux_dir"

# 创建链接
ln -s -f $tmux_dir/.tmux.conf $home_dir/
ln -s -f $dotfiles/.vimrc $home_dir/
ln -s -f $dotfiles/zsh/.zshrc $home_dir/
# yabai只有在mac下使用 todo 考虑根据系统 单独做一些事情吧
ln -s -f $dotfiles/yabai/.yabairc $home_dir/
ln -s -f $dotfiles/yabai/.skhdrc $home_dir/
# 复制local配置到home
cp -f $tmux_dir/.tmux.conf.local $home_dir/
# 使用自己的conf
echo "source-file $dot_file_dir/tmux/tmux.conf.myself" >> $home_dir/.tmux.conf.local

