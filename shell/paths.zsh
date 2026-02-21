# Path configuration for zsh

# Directory variables
export WS_DIR=/home/shreesht.scratch/workspace
export LOGS_DIR=$HOME/logs
export SCRATCH_DIR=/home/shreesht.scratch
export PVT_DIR=/home/shreesht.scratch/private/
export OBSIDIAN_VAULT_DIR=/home/shreesht.scratch/private/obsidian-vaults/

path=(
    $HOME/.npm-global/bin                           # npm global packages
    $HOME/.local/bin                                # Local user bin
    $HOME/utils                                     # Shreesh's utils
    $HOME/ws/scripts                                # Scripts
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
    $path
)

# NVCI tools
source /home/nv/utils/ghw-nvci/latest/setup/nvci-setup.sh

# Remove duplicates and export
typeset -U path
export PATH
