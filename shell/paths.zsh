# Path configuration for zsh

# Directory variables
export ws=/home/shreesht.scratch/workspace
export log=$HOME/log
export scratch=/home/shreesht.scratch
export pvt=$scratch/private/
export obs=$pvt/obsidian-vaults/
export config=$HOME/config

alias ws="cd $ws" 
alias log="cd $log" 
alias scr="cd $scratch" 
alias pvt="cd $pvt" 
alias obs="cd $obs" 
alias config="cd $config"
path=(
    $HOME/.npm-global/bin                           # npm global packages
    $HOME/.local/bin                                # Local user bin
    $HOME/utils                                     # Shreesh's utils
    $ws/scripts                                     # Scripts
    /home/nv/utils/fcv/common                       # FCV
    /home/nv/utils/crucible/1.0/bin                 # Crucible (Perforce wrapper)
    /home/utils/Python-3.12.5/bin                   # Python
    /home/utils/tmux-3.5a/bin                       # tmux
    /home/utils/xclip-0.13/bin                      # xclip
    /home/utils/doxygen-1.9.4/bin                   # doxygen
    /home/utils/graphviz-10.0.1/bin                 # graphviz
    /home/utils/tkdiff-4.3.4/tkdiff                 # tkdiff
    /home/utils/git-2.52.0/bin                      # git
    /home/utils/neovim-0.11.4/bin                   # neovim
    /home/utils/node-23.6.0/bin                     # node
    /home/nv/bin/socialgpt                          # socialgpt
    /home/tools_ai/anthropic-ai/claude/stable/claude # claude
    $(depth)/diag/testgen/
    $path
)

# NVCI tools
source /home/nv/utils/ghw-nvci/latest/setup/nvci-setup.sh

# Remove duplicates and export
typeset -U path
export PATH
