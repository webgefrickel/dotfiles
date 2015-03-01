#!/usr/bin/env bash

brew tap homebrew/dupes
brew tap homebrew/php

# install additional brew packages -- see _install.sh too
brew install curl
brew install docker
brew install boot2docker
brew install fasd
brew install git-extras
brew install git-flow
brew install httpd
brew install markdown
brew install mysql
brew install php56
brew install php56-mcrypt
brew install php56-xdebug
brew install php56-intl
brew install composer
brew install ssh-copy-id
brew install unrar
brew install youtube-dl

# brew cask and install software
brew cask install adium
brew cask install alfred
brew cask install amadeus-pro
brew cask install bartender
brew cask install betterzipql
brew cask install carbon-copy-cloner
brew cask install doxie
brew cask install dropbox
brew cask install firefox
brew cask install flux
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install imagealpha
brew cask install imageoptim
brew cask install istat-menus
brew cask install karabiner
brew cask install libreoffice
brew cask install qlcolorcode
brew cask install qlimagesize
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install seil
brew cask install sequel-pro
brew cask install slate
brew cask install things
brew cask install transmission
brew cask install truecrypt
brew cask install virtualbox
brew cask install vlc
brew cask install webpquicklook
brew cask install xld

# set some options for qlcolorcode
defaults write org.n8gray.QLColorCode font Menlo
defaults write org.n8gray.QLColorCode fontSizePoints 8
# maybe you have to copy solarized-dark into the caskroom to use it
# have a look a the most current github repo for qlcolorcode
defaults write org.n8gray.QLColorCode hlTheme solarized-dark
defaults write org.n8gray.QLColorCode extraHLFlags '--replace-tabs=2'
qlmanage -r

# the rest -> appstore or adobe or others, such as gpg have to be installed manually
