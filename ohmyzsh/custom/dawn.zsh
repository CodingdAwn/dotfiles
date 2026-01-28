# Put files in this folder to add your own custom functionality.
# See: https://github.com/ohmyzsh/ohmyzsh/wiki/Customization
#
# Files in the custom/ directory will be:
# - loaded automatically by the init script, in alphabetical order
# - loaded last, after all built-ins in the lib/ directory, to override them
# - ignored by git by default
#
# Example: add custom/shortcuts.zsh for shortcuts to your local projects
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr

zstyle ':completion:*' menu select
zmodload zsh/complist

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# export
export EDITOR='nvim'

# alais
alias v="nvim"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cp="cp -v"
alias mv="mv -v"
alias ll="ll -hl"
alias ra="ranger"
alias trans="trans :zh-CN -d"

# function
say() {
    echo "$*" | \
        python -m piper \
        --model ~/.local/share/piper/models/en_US-amy-medium.onnx \
        --output-raw | \
        aplay -r 22050 -f S16_LE -t raw - 2>/dev/null
}
