#! /bin/bash

##################################################
## TODO
## 1. done! 考虑已安装的soft如何检测 可以在任何时候调用脚本 增量安装未安装的soft
## 2. done! 解决一些bug 我记得只能在dotfiles目录执行此脚本 否则路径不对 -> 未测试
## 3. done! ln有的应该直接连接dir 如ranger 
## 4. done! 链接nvim的配置init.vim 链接coc-setting的配置到同样的目录
## 5. done! 安装完成后 把所有soft的version打印出来 输出到一个文件中 dpkg -s name | grep Version
##################################################

# set path
dot_file_dir=~/dotfiles
config_dir=~/.config
home_dir=~
github_repo_dir=~/github_repo
tmux_dir=$github_repo_dir/tmux
# set tmux repository url
tmux_github_url="https://github.com/gpakosz/.tmux.git"

echo "dot file dir is $dot_file_dir"
echo "home dir is $home_dir"
echo "github repository dir is $github_repo_dir"
echo "tmux dir is $tmux_dir"

# clean files
rm -f "$home_dir/.tmux.conf"
rm -f "$home_dir/.tmux.conf.local"
rm -f "$home_dir/.vimrc"
rm -f "$home_dir/.zshrc"
#rm -f "$home_dir/.yabairc"
#rm -f "$home_dir/.skhdrc"

#install .tmux
[ ! -d "$github_repo_dir" ] && mkdir -p $github_repo_dir && git clone "$tmux_github_url" "$tmux_dir"
[ ! -d "$config_dir" ] && mkdir -p $config_dir/coc

# 创建链接
ln -s -f $tmux_dir/.tmux.conf $home_dir/.tmux.conf
#ln -s -f $dot_file_dir/.vimrc $home_dir/.vimrc
ln -s -f $dot_file_dir/zsh/.zshrc $home_dir/.zshrc
ln -s -f $dot_file_dir/ranger $config_dir/ranger
#ln -s -f $dot_file_dir/coc/coc-settings.json $config_dir/nvim/coc-settings.json
#ln -s -f $dot_file_dir/nvim $config_dir/
ln -s -f $dot_file_dir/lazygit/config.yml $config_dir/lazygit/config.yml

# yabai只有在mac下使用 todo 考虑根据系统 单独做一些事情吧
#ln -s -f $dot_file_dir/yabai/.yabairc $home_dir
#ln -s -f $dot_file_dir/yabai/.skhdrc $home_dir

# 复制local配置到home
cp -f $tmux_dir/.tmux.conf.local $home_dir/
# 使用自己的conf
echo "source-file ${dot_file_dir}/tmux/tmux.conf.myself" >> $home_dir/.tmux.conf.local
