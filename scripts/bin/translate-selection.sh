#!/bin/zsh

# Source the file that defines the 'say' function
source /home/dawn/.oh-my-zsh/custom/func.zsh

# Ensure the 'say' function is autoloaded if necessary
autoload -U say

# Get the selected text from the primary X selection
selected_text=$(xclip -o)

if [ -z "$selected_text" ]; then
    # We can still use notify-send for simple errors
    notify-send "Translation" "No text selected."
    exit 1
fi

# Speak the original text in the background so it doesn't delay the window
say "$selected_text" &

# Launch Alacritty to display the full, colored, detailed translation.
# The `sh -c '...' sh "$selected_text"` is a safe way to pass the selected
# text to the command, preventing issues with special characters.
# The 'read' command keeps the window open until you press Enter.
alacritty -e sh -c 'trans :zh-CN -d -- "$1"; printf "\n\nPress Enter to close..."; read' sh "$selected_text"