#!/bin/bash

mkdir -p ~/.config/nvim/
cp neovim/init.vim ~/.config/nvim/init.vim
cp -a .vim/colors ~/.config/nvim/colors
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
