#!/bin/bash

SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)

if [ -d "${HOME}/.vim" ]; then
    echo "Directory ${HOME}/.vim exists."
    echo "Creating backup"
    mv ${HOME}/.vim ${HOME}/.vim.bak.$(date "+%Y%m%d%H%M%S")
fi

if [ -f "${HOME}/.vimrc" ]; then
    echo "File ${HOME}/.vimrc exists."
    echo "Creating backup"
    mv ${HOME}/.vimrc ${HOME}/.vimrc.bak.$(date "+%Y%m%d%H%M%S")
fi

mkdir ${HOME}/.vim
mkdir ${HOME}/.vim/autoload
mkdir ${HOME}/.vim/backup
mkdir ${HOME}/.vim/colors
mkdir ${HOME}/.vim/plugged

curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp $SHELL_FOLDER/vimrc ~/.vimrc

vim +PlugInstall +qall