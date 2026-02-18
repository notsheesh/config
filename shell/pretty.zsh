# Prompt configuration

export NAME="shreesht"
export HOST="pdx"

# Reset any stuck formatting
print -n '\e[0m'

autoload -U colors && colors
# Light mode prompt
# PROMPT="%F{22}${NAME}%F{125}@${HOST}%F{30}[%1~]>%f "

# Dark mode prompt
setopt PROMPT_SUBST
color_path() {
    local p="${PWD/#$HOME/~}"
    local -a parts
    parts=("${(@s:/:)p}")
    local n=${#parts}
    local -a colors
    colors=($fg_bold[green] $'\e[1;38;2;255;105;180m' $fg_bold[cyan])
    local out=""
    local start=$((n > 3 ? n - 2 : 1))
    local i=0
    for ((idx=start; idx<=n; idx++)); do
        out+="${colors[$((i % 3 + 1))]}${parts[$idx]}$reset_color"
        ((idx < n)) && out+="/"
        ((i++))
    done
    echo -n "$out"
}
PROMPT='
[$(color_path)]
%{$fg_bold[cyan]%}>%{$reset_color%} '
