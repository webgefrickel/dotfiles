#!/usr/bin/env bash
brew tap homebrew/dupes
brew tap homebrew/php
brew tap homebrew/versions
brew tap caskroom/versions

# install additional brew packages -- see _install.sh too
brew install composer
brew install curl --with-ssl --with-libssh2
brew install fasd
brew install ffmpeg --with-libvpx --with-libvorbis --with-fdk-aac
brew install git-extras
brew install git-flow
brew install git-ftp
brew install imagemagick
brew install mariadb
brew install mozjpeg
brew install nginx --with-http2
brew install openssl
brew install php70 --with-homebrew-curl --with-homebrew-openssl
brew install php70-intl
brew install php70-mcrypt
brew install rsync
brew install ruby
brew install the_silver_searcher
brew install tree
brew install wget
brew install youtube-dl

# brew cask and install software
brew cask install alfred
brew cask install carbon-copy-cloner
brew cask install firefox
brew cask install flux
brew cask install google-chrome
brew cask install imagealpha
brew cask install imageoptim
brew cask install karabiner
brew cask install libreoffice
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install seil
brew cask install sequel-pro
brew cask install slack
brew cask install slate
brew cask install telegram
brew cask install virtualbox
brew cask install vlc

# set some options for qlcolorcode
defaults write org.n8gray.QLColorCode font Hack
defaults write org.n8gray.QLColorCode fontSizePoints 9
# maybe you have to copy solarized-dark into the caskroom to use it
# have a look a the most current github repo for qlcolorcode
defaults write org.n8gray.QLColorCode hlTheme solarized-dark
defaults write org.n8gray.QLColorCode extraHLFlags '--replace-tabs=2'
qlmanage -r

# the rest -> appstore or adobe or others, such as gpg have to be installed manually
