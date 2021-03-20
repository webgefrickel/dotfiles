#!/usr/bin/env zsh

# ruby
brew install rbenv # restart terminal, then:
RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl" rbenv install 3.0.0
rbenv global 3.0.0

# node
curl -L https://git.io/n-install | bash
n v8
n v12
n latest
n lts
npm install -g npm@latest
npm update -g

# python
# first: find out the current python3 version in homebrew
# then install this version with pyenv and link it
brew install pyenv # restart terminal, then:
pyenv install 3.9.2
pyenv global 3.9.2
pip install --upgrade pip
mkdir /usr/local/Cellar/python@3.9
ln -s ~/.pyenv/versions/3.9.2 /usr/local/Cellar/python@3.9/3.9.2_2
brew link --overwrite python@3.9
