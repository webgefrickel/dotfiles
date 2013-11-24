#!/usr/bin/env bash

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

git submoulde init
git submodule update

chsh -s `which zsh`
/usr/bin/env/ zsh
source ~/.zshrc
sudo mv /etc/zshenv /etc/zprofile
