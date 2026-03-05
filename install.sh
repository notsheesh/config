#!/bin/bash

config="$(cd "$(dirname "$0")" && pwd)"
FORCE=false

[[ "$1" == "-y" ]] && FORCE=true

link() {
    src="$1"
    dest="$2"
    
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        if [[ "$FORCE" != true ]]; then
            read -p "$dest exists. Override? [y/N] " answer
            if [[ ! "$answer" =~ ^[Yy]$ ]]; then
                echo "Skipping $dest"
                echo ""
                return
            fi
        fi
    fi
    
    ln -sf "$src" "$dest"
    echo "Linked $dest"
    echo ""
}

# csh
link "$config/cshrc_custom" ~/.cshrc_custom

# zsh
link "$config/shell/zshrc" ~/.zshrc

# vim
link "$config/vimrc" ~/.vimrc

# neovim
mkdir -p ~/.config
link "$config/neovim" ~/.config/nvim

# kitty
mkdir -p ~/.config/kitty
link "$config/kitty.conf" ~/.config/kitty/kitty.conf

# tmux 
link "$config/tmux.conf" ~/.tmux.conf

echo "Done"
