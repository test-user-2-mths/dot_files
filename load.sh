#!/bin/bash

# you will need to change permissions on the file before you can run it
# chmod +x ./load.sh

# update and upgrade system
echo Update and upgrade system
sudo apt-get update && sudo apt-get dist-upgrade

# load .vimrc file
echo Load .vimrc file
cp ./.vimrc ~/.vimrc

# load YouCompleteMe
echo Load YouCompleteMe plugin for Vim
sudo apt install vim-youcompleteme
vim-addon-manager install youcompleteme

# load programming software
echo load Java
sudo apt install default-jdk
# you might need to get a newer version of swift
echo load Swift
apt-get install -y clang libblocksruntime0 libcurl4-openssl-dev
wget https://swift.org/builds/swift-5.4.1-release/ubuntu2004/swift-5.4.1-RELEASE/swift-5.4.1-RELEASE-ubuntu20.04.tar.gz
tar -zxvf swift-5.4.1-RELEASE-ubuntu20.04.tar.gz
sudo mkdir /usr/bin/swift
sudo cp -R ./swift-5.4.1-RELEASE-ubuntu20.04/usr/* /usr/bin/swift
echo 'export PATH="${PATH}":/usr/bin/swift/bin' >> ~/.bashrc

# remove this directory and all its files
echo remove this directory and all its files
sudo rm -R ~/dot_files
