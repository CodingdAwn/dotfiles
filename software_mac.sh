#!/bin/bash

# 使用brew 安装常用软件

# neovim
# fzf
# ranger

soft_list=$(brew list --formula)
echo $soft_list

brew update

need_install_list=""

# fzf --- fuzzy find
if [[ $soft_list == *"fzf"* ]]; then
  echo "--- fzf allready installed ---"
else
  need_install_list+=" fzf"
fi

# neovim --- 
if [[ $soft_list == *"neovim"* ]]; then
  echo "--- neovim allready installed ---"
else
  need_install_list+=" neovim"
fi

# ranger --- file manager
if [[ $soft_list == *"ranger"* ]]; then
  echo "--- ranger allready installed ---"
else
  need_install_list+=" ranger"
fi

# git-delta diff会显示更友好的变化 高亮变化项
if [[ $soft_list == *"git-delta"* ]]; then
  echo "--- git-delta allready installed ---"
else
  need_install_list+=" git-delta"
fi

# 安装所有软件
for soft in $need_install_list; do
  echo "installing $soft"
  brew install $soft
done
