#!/usr/bin/env zsh

# ruby
brew install rbenv # restart terminal, then:
RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl" rbenv install 3.0.2
rbenv global 3.0.2
gem install neovim

# node
curl -L https://git.io/n-install | bash
n v8
n v12
n lts
n latest
npm install -g npm@latest
npm install -g neovim
npm update -g

# python
# first: find out the current python3 version in homebrew
# then install this version with pyenv and link it
brew install pyenv # restart terminal, then:
pyenv install 3.9.8
pyenv global 3.9.8
pip install --upgrade pip
pip install neovim
