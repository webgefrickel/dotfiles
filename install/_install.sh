#!/usr/bin/env bash

# install xcode and other software from the app store
# everything neccessary first - command line tools
xcode-select --install

# install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor

# tap the casks
brew tap phinze/homebrew-cask

# brew paths
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# install some neccessary brew packages
brew install tmux
brew install zsh
brew install git
brew install brew-cask
brew install coreutils

brew cask install forklift
brew cask install iterm2
brew cask install dropbox

# install all submodules
git submodule init
git submodule update

# link the dotfiles
ln -s ~/dotfiles/agignore ~/.agignore
ln -s ~/dotfiles/editorconf ~/.editorconf
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/jshintrc ~/.jshintrc
ln -s ~/dotfiles/slate.js ~/.slate.js
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vifm ~/.vifm
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/pure/pure.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup

chsh -s `which zsh`
/usr/bin/env/ zsh
source ~/.zshrc
sudo mv /etc/zshenv /etc/zprofile
