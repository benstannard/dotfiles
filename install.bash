#!/bin/bash

echo "Updating dotfiles"
rm .bashrc
ln -s dotfiles/bashrc ~/.bashrc
ln -s dotfiles/init.el ~/.emacs.d/init.el
source ~/.bashrc
echo "Finished."
