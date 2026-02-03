#!/bin/bash

# dmenu list some my config path that I frequency to visit
# for example, dwm, oh my zsh custom path, dotfiles, neovim config
# use dmenu to list it

# Array of simple names for dmenu display
declare -a options=(
"dwm"
"neovim"
"zsh"
"dotfiles"
"todo"
)

# Use dmenu to choose from the options
choice=$(printf '%s\n' "${options[@]}" | dmenu -i -l 20 -p "Choose a config to open:")

# Check if a choice was made
if [ -n "$choice" ]; then
    case "$choice" in
        "dwm")
            alacritty -e nvim "$HOME/open_source/dwm/config.h"
            ;;
        "neovim")
            alacritty -e nvim "$HOME/.config/nvim/init.lua"
            ;;
        "zsh")
            alacritty -e nvim "$HOME/.oh-my-zsh/custom/dawn.zsh"
            ;;
        "todo")
            alacritty -e nvim "$HOME/dotfiles/vimwiki/Personal.md"
            ;;
        "dotfiles")
            alacritty -e sh -c "cd '$HOME/dotfiles'; exec zsh"
            ;;
    esac
fi
