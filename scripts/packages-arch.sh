#!/bin/bash
sudo pacman -Syy
sudo pacman -S xorg-server slim i3
sudo pacman -S gcc gvim git clang rxvt-unicode ctags xorg-xmodmap xorg-xinit autoconf chromium nitrogen openssh htop conky xsel network-manager network-manager-applet gnome-keyring dmenu imagemagick unzip
sudo pacman -S yubico-pam
./install-yaourt.sh
yaourt -S byobu
