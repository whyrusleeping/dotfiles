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
