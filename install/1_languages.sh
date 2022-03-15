#!/usr/bin/env zsh

# ruby & rust
brew install rbenv # restart terminal, then:
brew install rust
rbenv install 3.1.1
rbenv global 3.1.1
cargo install cargo-update

# node
curl -L https://git.io/n-install | bash
n v8
n v12
n v14
n lts
npm install -g npm@latest
npm update -g

# python
# first: find out the current python3 version in homebrew
# then install this version with pyenv and link it
brew install pyenv # restart terminal, then:
pyenv install 3.10.2
pyenv global 3.10.2
pip install --upgrade pip
