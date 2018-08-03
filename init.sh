#!/bin/bash

source globals.sh

$KONFIG_DIR/vundle_update.sh

# Initialize colors
mkdir -p ~/.vim/colors
cp $KONFIG_DIR/vim/bundle/vim-colorschemes/colors/* ~/.vim/colors

# Copy over configs
cp $KONFIG_DIR/.vimrc ~/.vimrc
cp $KONFIG_DIR/.bashrc ~/.bashrc
cp $KONFIG_DIR/.bashrc_specific ~/.bashrc_specific
cp $KONFIG_DIR/.tmux.conf ~/.tmux.conf

# source the new bashrc
source ~/.bashrc

# YouCompleteMe
$KONFIG_DIR/ycm_update.sh
