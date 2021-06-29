#!/bin/bash

# you will need to change permissions on the file before you can run it
# chmod +x ./load.sh

# then run this (so you do not have to type "yes" 3 times while it is running):
# yes yes yes | ./load.sh

# then at the end, reboot for everything to take effect
# sudo reboot now

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

# load java programming software
echo load Java
sudo apt install default-jdk

# loading checkstyle for java
# https://github.com/checkstyle/checkstyle/releases
echo load CheckStyle
wget https://github.com/checkstyle/checkstyle/releases/download/checkstyle-8.44/checkstyle-8.44-all.jar
sudo mkdir ~/java-style
sudo cp ./checkstyle-8.44-all.jar ~/java-style/checkstyle.jar
wget https://raw.githubusercontent.com/checkstyle/checkstyle/master/src/main/resources/google_checks.xml
sudo cp ./google_checks.xml ~/java-style/


# you might need to get a newer version of swift
# https://swift.org/download/
echo load Swift
sudo apt-get install -y clang libblocksruntime0 libcurl4-openssl-dev
wget https://swift.org/builds/swift-5.4.1-release/ubuntu2004/swift-5.4.1-RELEASE/swift-5.4.1-RELEASE-ubuntu20.04.tar.gz
tar -zxvf swift-5.4.1-RELEASE-ubuntu20.04.tar.gz
sudo mkdir /usr/bin/swift
sudo cp -R ./swift-5.4.1-RELEASE-ubuntu20.04/usr/* /usr/bin/swift
echo 'export PATH="${PATH}":/usr/bin/swift/bin' >> ~/.bashrc

# SwiftLint
# https://github.com/realm/SwiftLint/releases
echo load SwiftLint
wget https://github.com/realm/SwiftLint/releases/download/0.43.1/swiftlint_linux.zip
unzip -n swiftlint_linux.zip
sudo mkdir /usr/bin/swiftlint
sudo cp ./swiftlint /usr/bin/swiftlint/
echo 'export PATH="${PATH}":/usr/bin/swiftlint' >> ~/.bashrc

# Swift syntax highlighting for Vim
# Original Source: http://wingsquare.com/blog/swift-script-syntax-highlighting-and-indentation-for-vim-text-editor/
# Another helpful article: https://billyto.github.io/blog/swift-syntax-vim
# More about Vim packages: http://vimcasts.org/episodes/packages/
echo "--- creating ~/.vim/pack/bundle/start dir.."
mkdir -p ~/.vim/pack/bundle/start
echo "--- Cloning Apple's Swift repo.."
git clone --depth=1 https://github.com/apple/swift/
echo "--- Copying plugin to Vim bundles.."
cp -r ./swift/utils/vim ~/.vim/pack/bundle/start/swift
echo "--- Cleaning up, removing swift repo.."
rm -rf ./swift/

# change some BASH settings
echo 'PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '' >> ~/.bashrc
echo 'PROMPT_DIRTRIM=1' >> ~/.bashrc

# remove this directory and all its files
echo remove this directory and all its files
sudo rm -R ~/dot_files
cd ..
sudo reboot now
