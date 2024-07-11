#!/usr/bin/env zsh

# ruby
brew install rbenv # restart terminal, then:
rbenv install 3.3.1
rbenv global 3.3.1

# node
curl -L https://git.io/n-install | bash
n v8
n v14
n v16
n v18
n lts
npm install -g npm@latest
npm update -g

# python
# first: find out the current python3 version in homebrew
# then install this version with pyenv and link it
brew install pyenv # restart terminal, then:
pyenv install 3.12.3
pyenv global 3.12.3
pip install --upgrade pip
pip install setuptools
