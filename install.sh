#!/bin/bash
mkdir -p ~/.config/fish
ln ~/code/dotfiles/.vimrc ~/.vimrc
ln -s ~/code/dotfiles/.vim ~/.vim
ln -s ~/code/dotfiles/.fonts ~/.fonts
ln ~/code/dotfiles/.gitconfig ~/.gitconfig
ln ~/code/dotfiles/.Xdefaults ~/.Xdefaults
ln ~/code/dotfiles/config.fish ~/.config/fish/config.fish

#initialize vundle
git submodule init
git submodule update

#Load vim bundles
vim +:BundleInstall +:qa

#clone fish-shell down, make and install it
cd ~/code && git clone https://github.com/fish-shell/fish-shell
export CFLAGS="-O3"
cd ~/code/fish-shell && autoconf && ./configure && \
	make -j 16 && sudo make install

echo "/usr/local/bin/fish" >> /etc/shells

#clone awesome theme down
cd ~/code && git clone https://github.com/whyrusleeping/powerarrow
ln -s ~/code/powerarrow ~/.config/awesome

