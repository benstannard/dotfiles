#!/bin/bash

echo "Updating dotfiles"
rm .bashrc
ln -s dotfiles/bashrc ~/.bashrc
ln -s dotfiles/init.el ~/.emacs.d/init.el
ln -s dotfiles/vimrc ~/.vimrc
source ~/.bashrc
echo "Finished."
