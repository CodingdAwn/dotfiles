#!/bin/bash

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
# 复制local配置到home
cp -f $tmux_dir/.tmux.conf.local $home_dir/
# 使用自己的conf
echo "source-file $dot_file_dir/tmux.conf.myself" >> $home_dir/.tmux.conf.local

