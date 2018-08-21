#!/bin/bash

source globals.sh

(cd $VIM_SRC_DIR; make distclean)

# $VIM_SRC_DIR/configure --disable-nls --enable-cscope --enable-gui=no --enable-multibyte  --enable-pythoninterp --enable-rubyinterp --prefix=/home/jonny/.local/vim --with-features=huge  --with-python-config-dir=/usr/lib/pyth/config --with-tlib=ncurses --without-x
(cd $VIM_SRC_DIR; ./configure --disable-nls --enable-cscope --enable-gui=no --enable-multibyte  --enable-pythoninterp --enable-rubyinterp --prefix=/home/jonny/.local/vim --with-features=huge  --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu --with-tlib=ncurses --without-x)

# make
(cd $VIM_SRC_DIR; make && make install prefix=$KONFIG_DIR/vim/source)
