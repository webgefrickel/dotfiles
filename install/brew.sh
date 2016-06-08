#!/usr/bin/env bash
brew tap homebrew/dupes
brew tap homebrew/php
brew tap caskroom/versions

# install additional brew packages -- see _install.sh too
brew install composer
brew install curl
brew install ffmpeg --with-libvpx --with-libvorbis --with-fdk-aac
brew install git-extras
brew install git-flow
brew install imagemagick
brew install mariadb
brew install mozjpeg
brew install nginx --with-http2
brew install php70
brew install php70-intl
brew install php70-mcrypt
brew install ruby
brew install ssh-copy-id
brew install the_silver_searcher
brew install wget
brew install youtube-dl

# brew cask and install software
brew cask install 1password
brew cask install alfred
brew cask install atom
brew cask install carbon-copy-cloner
brew cask install firefox
brew cask install flux
brew cask install gitkraken
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install imagealpha
brew cask install imageoptim
brew cask install karabiner
brew cask install libreoffice
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install seil
brew cask install sequel-pro
brew cask install slate
brew cask install telegram
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc

# set some options for qlcolorcode
defaults write org.n8gray.QLColorCode font Hack
defaults write org.n8gray.QLColorCode fontSizePoints 8
# maybe you have to copy solarized-dark into the caskroom to use it
# have a look a the most current github repo for qlcolorcode
defaults write org.n8gray.QLColorCode hlTheme solarized-dark
defaults write org.n8gray.QLColorCode extraHLFlags '--replace-tabs=2'
qlmanage -r

# the rest -> appstore or adobe or others, such as gpg have to be installed manually
