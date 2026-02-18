# Aliases for zsh

# ls without bold (use colors but no bold)
export LS_COLORS='di=34:ln=36:so=35:pi=33:ex=32:bd=33;40:cd=33;40:su=32;40:sg=32;40:tw=34;40:ow=34;40'
alias ls='ls --color=auto'

# Editor
alias e="$EDITOR"
alias diff="$DIFFER"
alias vim="nvim"
alias esh="e $WS_DIR/scripts/sheesh"
alias sheesh="source $WS_DIR/scripts/sheesh"

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
alias .='pwd'
alias ..='pwd && cd .. && pwd'
alias ...='pwd && cd .. && pwd && cd .. && pwd'
alias cdd='cd "${PWD%/*}"'
alias ws="cd $WS_DIR"
alias scr="cd $SCRATCH_DIR"
alias pvt="cd $PVT_DIR" 
alias obs="cd $OBSIDIAN_VAULT_DIR"
alias nvsync="bash $OBSIDIAN_VAULT_DIR/sync.sh" 
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
alias env="/home/nv/bin/envupdate -c"
alias src="source ~/.zshrc"
alias erc="$EDITOR ~/.zshrc"
alias r="reset && source ~/.zshrc"

# Utility
alias nv="socialgpt"
alias h="history"
alias clear="clear && printf '\e[3J'"
alias py="python3"
# rm wrapper in $WS_DIR/utils/rm guards against rm -rf accidents

# Perforce
alias p4reset="p4 sync --parallel=threads=3 -f ./...@_golden_nvgpu"

# Tools
alias tll="$EDITOR ~/listen.log"
alias chipnemo="/home/nv/utils/chipnemo-cli/release/chipnemo"
alias nemo="chipnemo ask --stream --model 'Claude Sonnet 4.5'"
alias codex="codex -c use_linux_sandbox_bwrap=true"

# Scrappy
alias sc="scrappy script"
alias note="scrappy note"
