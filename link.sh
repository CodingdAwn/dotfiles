#! /bin/bash

# set path
dot_file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
config_dir=~/.config
# kitty
kitty_dir="${config_dir}/kitty"
# hyprland
hypr_dir="${config_dir}/hypr"
# fish
fish_dir="${config_dir}/fish"
# nvim
nvim_dir="${config_dir}/nvim"
# !TODO
# mpd
# qutebrowser

echo "-----------------------------"
echo "dotfiles dir: ${dot_file_dir}"
echo "kitty dir: ${kitty_dir}"
echo "hyprland dir: ${hypr_dir}"
echo "fish dir: ${fish_dir}"
echo "nvim dir: ${nvim_dir}"
echo 

# link kitty config
if [[ ! -d "${kitty_dir}/custom" ]]; then
  ln -sf --no-target-directory "${dot_file_dir}/kitty/custom" "${kitty_dir}/custom"
  # wrtie some source code
cat << EOF >> "${kitty_dir}/kitty.conf"

include ~/.config/kitty/custom/kitty.conf
EOF
else
  echo "${kitty_dir}/custom is exist!"
fi

# link hyprland config
if [[ ! -d "${hypr_dir}/custom" ]]; then
  ln -sf --no-target-directory "${dot_file_dir}/hypr/custom" "${hypr_dir}/custom"
else
  echo "${hypr_dir}/custom is exist!"
fi

# link fish config
if [[ ! -d "${fish_dir}/custom" ]]; then
  ln -sf --no-target-directory "${dot_file_dir}/fish/custom" "${fish_dir}/custom"
  # wrtie some source code
cat << EOF >> "${fish_dir}/config.fish"

source ~/.config/fish/custom/alias.fish
source ~/.config/fish/custom/export.fish
EOF
else
  echo "${fish_dir}/custom is exist!"
fi

# link nvchad config
if [[ ! -d "${nvim_dir}/lua" ]]; then
  ln -sf --no-target-directory "${dot_file_dir}/nvchad/lua" "${nvim_dir}/lua"
else
  echo "${nvim_dir}/lua is exist!"
fi

if [[ ! -d "${nvim_dir}/after" ]]; then
  ln -sf --no-target-directory "${dot_file_dir}/nvchad/after" "${nvim_dir}/after"
else
  echo "${nvim_dir}/after is exist!"
fi

if [[ ! -d "${nvim_dir}/my_snippets" ]]; then
  ln -sf --no-target-directory "${dot_file_dir}/nvchad/my_snippets" "${nvim_dir}/my_snippets"
else
  echo "${nvim_dir}/my_snippets is exist!"
fi
