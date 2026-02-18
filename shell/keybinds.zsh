# Keybindings for zsh line editor (ZLE)
# Emacs mode gives us Ctrl+A/E/K by default
bindkey -e

# Word navigation 
# Option+Arrow (sends escape sequence \e[1;3*)
bindkey "\e[1;3D" backward-word
bindkey "\e[1;3C" forward-word
# Cmd+Arrow in Cursor terminal (sends escape sequence \e[1;9*)
bindkey "\e[1;9D" backward-word
bindkey "\e[1;9C" forward-word

# Word deletion (Option+Backspace)
bindkey "\e^?" backward-kill-word
