# Path configuration for csh/tcsh
# Source this file to set up PATH

########################################
# PATH DIRECTORIES
########################################

# Local user bin
if ( -d "$HOME/.local/bin" ) then
    set path = ($HOME/.local/bin $path:q)
endif

# Personal utils
set path = ($HOME/utils $path:q)

# Fav utils 
set path = ( \
    /home/utils/tmux-3.5a/bin \
    /home/utils/xclip-0.13/bin \
    /home/utils/doxygen-1.9.4/bin \
    /home/utils/graphviz-10.0.1/bin \
    /home/nv/bin/socialgpt \
    /home/utils/tkdiff-4.3.4/tkdiff \
    /home/utils/neovim-0.10.3/bin \
    /home/utils/node-23.6.0/bin \
    $path:q \
)

# FCV utils
set path = ( \
    /home/nv/utils/fcv/common \
    $HOME/utils \
    $HOME/ws/scripts \
    $path:q \
)

# Python
set path = (/home/utils/Python-3.12.5/bin $path:q)

# Crucible (Perforce wrapper)
set path = (/home/nv/utils/crucible/1.0/bin $path:q)

# NVCI tools
source /home/nv/utils/ghw-nvci/latest/setup/nvci-setup.csh
