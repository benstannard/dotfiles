#!/bin/bash

echo "Updating dotfiles"
cd $HOME

# remove dotfiles
rm .bashrc
rm .screenrc
mkdir .emacs.d

# create symlinks
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/init.el ~/.emacs.d/init.el
ln -s ~/dotfiles/vimrc ~/.vimrc
<<<<<<< HEAD
=======
ln -s ~/dotfiles/screenrc ~/.screenrc
>>>>>>> e5989f23b36b5f601ef1adaa85562b10821581df
ln -s ~/dotfiles/gitconfig ~/.gitconfig

# refresh & exit
source ~/.bashrc
echo "Dotfiles updated successfully"
