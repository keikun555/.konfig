#!/bin/bash

KONFIG_DIR=~/.konfig
BUNDLE_DIR=$KONFIG_DIR/vim/bundle

$KONFIG_DIR/vundle_updater.sh

# Initialize colors
mkdir -p ~/.vim/colors
cp $KONFIG_DIR/vim/bundle/vim-colorschemes/colors/* ~/.vim/colors

# YouCompleteMe
python $BUNDLE_DIR/YouCompleteMe/install.py --clang-completer

# Copy over configs
cp $KONFIG_DIR/.vimrc ~/.vimrc
cp $KONFIG_DIR/.bashrc ~/.bashrc
cp $KONFIG_DIR/.tmux.conf ~/.tmux.conf
