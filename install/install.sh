#!/usr/bin/env bash
# install xcode and other software from the app store
# everything neccessary first - command line tools
xcode-select --install

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew tap homebrew/services

# brew paths
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# install some neccessary brew packages
brew install clipper
brew install fzf
brew install git
brew install neovim --HEAD
brew install python
brew install tmux
brew install ruby
brew install zsh

# install all submodules
git submodule init
git submodule update

# link the dotfiles
mkdir ~/.config
ln -s ~/dotfiles/editorconfig ~/.editorconfig
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/hammerspoon ~/.hammerspoon
ln -s ~/dotfiles/karabiner ~/.config/karabiner
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/zsh ~/.zsh
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc

# install fzf
/usr/local/opt/fzf/install

# clipper
mkdir -p ~/Library/LaunchAgents
brew services start clipper

# install deps + plugins for neovim
pip3 install neovim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.config/nvim/dein
rm installer.sh

# set xterm/screen terminals to enable italic fonts in terminal
# set terminal to xterm-256color!
# now restart your terminal and hope for the best
tic ~/dotfiles/other/xterm-256color.terminfo

# set zsh to the default
sudo vim /etc/shells
chsh -s /usr/local/bin/zsh
/usr/bin/env zsh
sudo launchctl config user path $PATH
