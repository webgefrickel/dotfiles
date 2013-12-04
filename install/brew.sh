#!/usr/bin/env bash

# NOTE install xcode first / via app store
# this re-updates the command line tools
xcode-select --install

brew tap homebrew/dupes
brew tap josegonzalez/homebrew-php
brew tap phinze/homebrew-cask

# install brew packages
brew install ack
brew install brew-cask
brew install composer
brew install coreutils
brew install curl
brew install ghostscript
brew install git
brew install git-flow
brew install macvim
brew install markdown
brew install mcrypt
brew install mysql
brew install node
brew install phake
brew install php55
brew install php55-mcrypt
brew install php55-xdebug
brew install rbenv
brew install reattach-to-user-namespace
brew install ruby-build
brew install ssh-copy-id
brew install subversion
brew install the_silver_searcher
brew install tmux
brew install unrar
brew install wget
brew install zsh

# brew cask and install software

brew cask install adium
brew cask install alfred
brew cask install amadeus-pro
brew cask install carbon-copy-cloner
brew cask install doxie
brew cask install dropbox
brew cask install firefox
brew cask install f-lux
brew cask install forklift
brew cask install ghostlab
brew cask install google-chrome
brew cask install imagealpha
brew cask install imageoptim
brew cask install istat-menus
brew cask install iterm2
brew cask install key-remap4-mac-book
brew cask install libre-office
brew cask install miro-video-converter
brew cask install opera
brew cask install pc-keyboardhack
brew cask install sequel-pro
brew cask install simple-comic
brew cask install skype
brew cask install slate
brew cask install things
brew cask install timings
brew cask install transmission
brew cask install true-crypt
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc
brew cask install xld

# the rest -> appstore :-)
