ln ~/code/dotfiles/.vimrc ~/.vimrc
ln -s ~/code/dotfiles/.vim ~/.vim
ln -s ~/code/dotfiles/.fonts ~/.fonts
ln ~/code/dotfiles/.gitconfig ~/.gitconfig
ln ~/code/dotfiles/.Xdefaults ~/.Xdefaults

#initialize vundle
git submodule init
git submodule update

#Load vim bundles
vim +:BundleInstall +:qa
