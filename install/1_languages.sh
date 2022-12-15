#!/usr/bin/env zsh

# ruby
brew install rbenv # restart terminal, then:
rbenv install 3.1.3
rbenv global 3.1.3

# node
curl -L https://git.io/n-install | bash
n v14
n v16
n lts
npm install -g npm@latest
npm update -g

# python
# first: find out the current python3 version in homebrew
# then install this version with pyenv and link it
brew install pyenv # restart terminal, then:
pyenv install 3.11.1
pyenv global 3.11.1
pip install --upgrade pip
