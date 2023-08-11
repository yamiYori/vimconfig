#!/bin/bash

SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)

if [ -d "~/.vim" ]; then
    echo "Directory ~/.vim exists."
    echo "Creating backup"
    mv ~/.vim ~/.vim.bak.$(date "+%Y%m%d%H%M%S")
fi

if [ -f "~/.vimrc" ]; then
    echo "File ~/.vimrc exists."
    echo "Creating backup"
    mv ~/.vimrc ~/.vimrc.bak.$(date "+%Y%m%d%H%M%S")
fi

mkdir ~/.vim
mkdir ~/.vim/autoload
mkdir ~/.vim/backup
mkdir ~/.vim/colors
mkdir ~/.vim/plugged

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp $SHELL_FOLDER/vimrc ~/.vimrc

vim +PlugInstall +qall