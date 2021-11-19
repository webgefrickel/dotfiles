#!/usr/bin/env bash
# install xcode and other software from the app store
# everything neccessary first - command line tools
xcode-select --install
sudo xcodebuild -license
sudo softwareupdate --install-rosetta

# default macos settings
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.Finder AppleShowAllFiles -bool true

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

# basic config symlinks
mkdir ~/.config
cd ~/dotfiles
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/zsh ~/.zsh
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc

# set xterm/screen terminals to enable italic fonts in terminal
tic ~/dotfiles/other/xterm-256color.terminfo

# zsh as default
sudo vim /etc/shells
chsh -s /opt/homebrew/bin/zsh
/usr/bin/env zsh
sudo launchctl config user path $PATH

autoload -Uz compinit
compinit
# now restart your terminal and proceed...
