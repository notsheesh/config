#!/bin/bash

CONFIG_DIR="$(cd "$(dirname "$0")" && pwd)"
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
link "$CONFIG_DIR/cshrc_custom" ~/.cshrc_custom

# zsh
link "$CONFIG_DIR/shell/zshrc" ~/.zshrc

# vim
link "$CONFIG_DIR/vimrc" ~/.vimrc

# neovim
mkdir -p ~/.config
link "$CONFIG_DIR/neovim" ~/.config/nvim

# kitty
mkdir -p ~/.config/kitty
link "$CONFIG_DIR/kitty.conf" ~/.config/kitty/kitty.conf

# tmux 
link "$CONFIG_DIR/tmux.conf" ~/.tmux.conf

echo "Done"
