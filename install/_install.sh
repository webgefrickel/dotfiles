#!/usr/bin/env bash

# install xcode and other software from the app store
# everything neccessary first - command line tools
xcode-select --install

# install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor

# tap the casks
brew tap caskroom/homebrew-cask
brew tap caskroom/versions

# brew paths
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# install some neccessary brew packages
brew install brew-cask
brew install coreutils
brew install git
brew install macvim --with-cscope --with-lua --HEAD
brew install reattach-to-user-namespace
brew install tmux
brew install the_silver_searcher
brew install wget
brew install zsh

brew cask install dropbox
brew cask install forklift
brew cask install iterm2

# set zsh to the default
sudo vim /etc/shells
chsh -s /usr/local/bin/zsh
/usr/bin/env zsh
sudo mv /etc/zshenv /etc/zprofile

# install all submodules
git submodule init
git submodule update

# link the dotfiles
ln -s ~/dotfiles/agignore ~/.agignore
ln -s ~/dotfiles/editorconfig ~/.editorconfig
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/jshintrc ~/.jshintrc
ln -s ~/dotfiles/jscsrc ~/.jscsrc
ln -s ~/dotfiles/slate.js ~/.slate.js
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zsh ~/.zsh
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/pure/pure.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup
ln -s ~/dotfiles/tmux/tmuxifier ~/.tmuxifier

# now restart your terminal/iterm2 and hope for the best
