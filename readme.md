#Whyrusleeping's Dotfiles (Primarily Vim)

##Installation
To install this, clone it somewhere (i use ~/code/dotfiles) and do the following:

    ln ~/code/dotfiles/.vimrc ~/.vimrc
	ln -s ~/code/dotfiles/.vim ~/.vim

(and the same for the .zshrc and .zshenv files if you use zsh)

##For full functionality please have the following installed:

- clang
- ctags

##Common shortcuts:

- :A 	- swap header/source (thanks to a.vim)
- ,qa 	- quit all
- ,w 	- move to next window
- ,kf 	- autoindent entire page
- <C-b>	- `make`
- ,s	- replace word under cursor (replaces only fully matching words!)
- ,c	- toggles quickfix window
