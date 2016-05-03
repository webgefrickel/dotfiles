#!/usr/bin/env bash

# install xcode and other software from the app store
# everything neccessary first - command line tools
xcode-select --install

read -p "Press any key to continue... " -n1 -s

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# brew paths
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# install some neccessary brew packages
brew install clipper
brew install coreutils
brew install fasd
brew install git
brew install tmux
brew install zsh

# install macvim and neobundle for vim
brew install macvim --with-cscope --with-lua --HEAD
mkdir ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# this is the minimal software used
brew cask install forklift
brew cask install iterm2
brew cask install owncloud

# add a nice font
brew cask install caskroom/fonts/font-hack
brew linkapps
brew tap homebrew/services

# clipper
mkdir -p ~/Library/LaunchAgents
brew services start clipper

# install all submodules
git submodule init
git submodule update

# link the dotfiles
ln -s ~/dotfiles/agignore ~/.agignore
ln -s ~/dotfiles/editorconfig ~/.editorconfig
ln -s ~/dotfiles/eslintrc ~/.eslintrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/slate.js ~/.slate.js
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zsh ~/.zsh
ln -s ~/dotfiles/zshrc ~/.zshrc

# set xterm/screen terminals to enable italic fonts in terminal
tic ~/dotfiles/terminfo/xterm-256color.terminfo

# set iterm terminal to xterm-256color and enable italics!
# now restart your terminal/iterm2 and hope for the best

# set zsh to the default
sudo vim /etc/shells
chsh -s /usr/local/bin/zsh
/usr/bin/env zsh
sudo mv /etc/zshenv /etc/zprofile
