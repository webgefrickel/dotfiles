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
brew install fzf
brew install git
brew install koekeishiya/kwm/kwm
brew install koekeishiya/khd/khd
brew install tmux
brew install zsh
brew install neovim/neovim/neovim --HEAD
brew install python3
read -p "Press any key to continue... " -n1 -s

# install deps + plugins for neovim
pip3 install neovim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.config/nvim/dein
read -p "Press any key to continue... " -n1 -s

# install fzf
/usr/local/opt/fzf/install
read -p "Press any key to continue... " -n1 -s

# this is the minimal software and fonts used
brew cask install forklift
brew cask install hyper
brew cask install iterm2
brew cask install owncloud
brew cask install caskroom/fonts/font-hack
read -p "Press any key to continue... " -n1 -s

brew linkapps
brew tap homebrew/services

# clipper + kwm/khd
mkdir -p ~/Library/LaunchAgents
brew services start clipper
brew services start khd
brew services start kwm

# install all submodules
git submodule init
git submodule update

# link the dotfiles
ln -s ~/dotfiles/agignore ~/.agignore
ln -s ~/dotfiles/config ~/.config
ln -s ~/dotfiles/editorconfig ~/.editorconfig
ln -s ~/dotfiles/gemrc ~/.gemrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/hyperterm.js ~/.hyperterm.js
ln -s ~/dotfiles/khdrc ~/.khdrc
ln -s ~/dotfiles/kwm ~/.kwm
ln -s ~/dotfiles/ruby-version ~/.ruby-version
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/zsh ~/.zsh
ln -s ~/dotfiles/zshrc ~/.zshrc

# set xterm/screen terminals to enable italic fonts in terminal
tic ~/dotfiles/other/xterm-256color.terminfo

# set iterm terminal to xterm-256color!
# now restart your terminal/iterm2 and hope for the best

# set zsh to the default
sudo vim /etc/shells
chsh -s /usr/local/bin/zsh
/usr/bin/env zsh
sudo mv /etc/zshenv /etc/zprofile
sudo launchctl config user path $PATH
