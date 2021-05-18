#!/usr/bin/env bash
# install xcode and other software from the app store
# everything neccessary first - command line tools
xcode-select --install

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew doctor

# brew paths
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# basics
brew install curl
brew install git
brew install git-flow
brew install openssl
brew install zsh

# install all submodules
cd ~/dotfiles
git submodule init
git submodule update
git submodule foreach git pull origin master

# basic config symlinks
mkdir ~/.config
ln -s ~/dotfiles/editorconfig ~/.editorconfig
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/zsh ~/.zsh
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc

# set xterm/screen terminals to enable italic fonts in terminal
tic ~/dotfiles/other/xterm-256color.terminfo

# zsh as default
sudo vim /etc/shells
chsh -s /usr/local/bin/zsh
/usr/bin/env zsh
sudo launchctl config user path $PATH

autoload -Uz compinit
compinit
# now restart your terminal and proceed...
