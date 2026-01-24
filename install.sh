#!/bin/bash

CONFIG_DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
    src="$1"
    dest="$2"
    
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        read -p "$dest exists. Override? [y/N] " answer
        if [[ ! "$answer" =~ ^[Yy]$ ]]; then
            echo "Skipping $dest"
            echo ""
            return
        fi
    fi
    
    ln -sf "$src" "$dest"
    echo "Linked $dest"
    echo ""
}

# csh
link "$CONFIG_DIR/cshrc_custom" ~/.cshrc_custom

# vim
link "$CONFIG_DIR/vimrc" ~/.vimrc

# kitty
mkdir -p ~/.config/kitty
link "$CONFIG_DIR/kitty.conf" ~/.config/kitty/kitty.conf

echo "Done"
