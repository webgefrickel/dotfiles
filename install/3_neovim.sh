#!/usr/bin/env zsh

brew install neovim
gem install neovim
pip install neovim
npm install -g neovim

# link config files
ln -s ~/dotfiles/nvim ~/.config/nvim

# Don't forget to update all dependencies
nvim +TSUpdate
nvim +Lazy
nvim +Mason
nvim +checkhealth
