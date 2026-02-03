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
            alacritty -e zsh -c "cd $HOME/open_source/dwm ; nvim '$HOME/open_source/dwm/config.h' ; zsh"
            ;;
        "neovim")
            alacritty -e zsh -c "cd $HOME/.config/nvim ; nvim '$HOME/.config/nvim/init.lua' ; zsh"
            ;;
        "zsh")
            alacritty -e zsh -c "cd $HOME/.oh-my-zsh/custom ; nvim '$HOME/.oh-my-zsh/custom/dawn.zsh' ; zsh"
            ;;
        "todo")
            # use + or use -c flag
            alacritty -e zsh -c "nvim '+lua require(\"lazy\").load({plugins={\"vimwiki\"}})' '+VimwikiIndex' ; zsh"
            ;;
        "dotfiles")
            alacritty -e sh -c "cd '$HOME/dotfiles'; exec zsh"
            ;;
    esac
fi
