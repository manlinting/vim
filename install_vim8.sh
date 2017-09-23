#!/bin/bash
#########################################################################
# Author: lincolnlin
# Created Time: Sat Sep 23 04:39:19 2017
# File Name: install_vim8.sh
# Description: 
#########################################################################


git clone https://github.com/vim/vim.git --depth=1 && cd vim/

./configure --prefix=/usr/local/vim8 --enable-multibyte  --with-tlib=tinfo  --enable-pythoninterp --with-features=huge

make 

make install

echo "alias vim='/usr/local/vim8/bin/vim'" >> ~/.bashrc

source ~/.bashrc
