#!/bin/bash

echo "Updating dotfiles"
cd $HOME
rm .bashrc
mkdir .emacs.d
ln -s dotfiles/bashrc ~/.bashrc
ln -s dotfiles/init.el ~/.emacs.d/init.el
ln -s dotfiles/vimrc ~/.vimrc
ln -s dotfiles/tmux.conf ~/.tmux.conf
ln -s dotfiles/gitconfig ~/.gitconfig
source ~/.bashrc
echo "Finished."
