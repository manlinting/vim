#!/bin/bash
#########################################################################
# Author: lincolnlin
# Created Time: Sun 22 Nov 2015 04:22:57 AM EST
# File Name: init_vim.sh
# Description: 
#########################################################################
yum install vim -y


#安装依赖项
yum instal ctag
pip install pyflakes


cp .vimrc ~/

git clone https://github.com/gmarik/vundle.git  ~/.vim/bundle/vundle

vim +BundleInstall +qall

cp ~/.vim/bundle/vim-colorschemes/colors/ -rf ~/.vim/

echo "Install Vim Success!"
