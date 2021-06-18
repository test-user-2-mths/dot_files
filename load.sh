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

# load programming software
echo load Java
sudo apt install default-jdk
# you might need to get a newer version of swift
echo load Swift
wget https://swift.org/builds/swift-5.4.1-release/ubuntu2004/swift-5.4.1-RELEASE/swift-5.4.1-RELEASE-ubuntu20.04.tar.gz
tar -zxvf swift-5.4.1-RELEASE-ubuntu20.04.tar.gz
sudo mkdir /usr/bin/swift
sudo cp -R ./swift-5.4.1-RELEASE-ubuntu20.04/usr/* /usr/bin/swift
export PATH="${PATH}":/usr/bin/swift/bin

# remove this directory and all its files
echo remove this directory and all its files
sudo rm -R ~/dot_files
