# Aliases for zsh

# ls without bold (use colors but no bold)
# export LS_COLORS='di=34:ln=36:so=35:pi=33:ex=32:bd=33;40:cd=33;40:su=32;40:sg=32;40:tw=34;40:ow=34;40'
# alias ls="eza --icons=always --sort=extension --group-directories-first --dereference --header"
# alias lsd="ls -D" 
# alias lsf="ls -f"
alias go="z" 
alias goi="zi"

# Editor
alias e="$EDITOR"
alias diff="$DIFFER"
alias vim="nvim"
alias vimdiff="nvim -d"
alias esh="e $ws/scripts/sheesh"
alias sheesh="source $ws/scripts/sheesh"

# Navigation
back() {
    if [[ -z "$1" ]]; then
        command back
        return
    fi
    local target
    target="$(command back "$1")" || return $?
    cd "$target" && pwd
}
alias ..='pwd && cd .. && pwd'
alias ...='pwd && cd .. && pwd && cd .. && pwd'
alias note="$EDITOR $obs/note.txt"
alias nvsync="bash $obs/sync.sh" 
alias dep='cd "$(depth)"'
alias abs='pwd && cd "$(readlink -f .)"'

# flx: jump to clone by ID or run command
flx() {
    local arg="$1"
    if [[ -z "$arg" ]]; then
        command flx help
        return $?
    fi

    if [[ "$arg" == <-> ]]; then
        local target
        target="$(command flx --path "$arg")" || return $?
        if [[ -z "$target" ]]; then
            echo "Invalid ID: $arg" >&2
            return 1
        fi
        cd "$target" || return $?
        pwd
        return 0
    fi

    command flx "$@"
}

# Environment
alias envupdate="/home/nv/bin/envupdate -c"
alias src="source ~/.zshrc"
alias erc="$EDITOR ~/.zshrc"
alias r="reset && source ~/.zshrc"

# Utility
alias nv="socialgpt"
alias clear="clear && printf '\e[3J'"

# Perforce
alias p4reset="p4 sync --parallel=threads=3 -f ./...@_golden_nvgpu"

# Tools
alias tll="$EDITOR ~/listen.log"
alias codex="codex -c use_linux_sandbox_bwrap=true"

