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

brew install git
brew install git-flow
brew install python@3
brew install ruby
brew install zsh
brew link python@3

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

# set xterm/screen terminals to enable italic fonts in terminal
# set terminal to xterm-256color!
# now restart your terminal and hope for the best
tic ~/dotfiles/other/xterm-256color.terminfo

# set zsh to the default
sudo vim /etc/shells
chsh -s /usr/local/bin/zsh
/usr/bin/env zsh
sudo launchctl config user path $PATH
