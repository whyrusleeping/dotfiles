#!/bin/bash
sudo pacman -Syy
sudo pacman -S xorg-server slim i3
sudo pacman -S gcc gvim git clang rxvt-unicode ctags xorg-xmodmap xorg-xinit autoconf chromium nitrogen openssh htop conky xsel networkmanager network-manager-applet gnome-keyring dmenu imagemagick unzip htop wget feh shutter mercurial
sudo pacman -S yubico-pam
./install-yaourt.sh
yaourt -S byobu
