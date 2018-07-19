#!/bin/bash
( cd ~/.konfig; git submodule update --init --recursive)
mkdir -p ~/.vim/colors
cp ~/.konfig/vim/bundle/vim-colorschemes/colors/* ~/.vim/colors
