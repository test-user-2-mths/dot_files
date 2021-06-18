#!/bin/bash

# update and upgrade system
echo Update and upgrade system
sudo apt-get update && sudo apt-get dist-upgrade

# load .vimrc file
echo Load .vimrc file
cp ./.vimrc ~/.vimrc

# load YouCompleteMe
echo Load YouCompleteMe plugin for Vim
sudo apt install vim-youcompleteme
sudo vim-addon-manager install youcompleteme

# remove this directory and all its files
echo remove this directory and all its files
sudo rm -R ~/dot_files
