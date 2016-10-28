#!/usr/bin/env bash
brew tap caskroom/versions

# brew cask and install software
brew cask install alfred
brew cask install carbon-copy-cloner
brew cask install cleanmymac
brew cask install dash
brew cask install doxie
brew cask install firefox
brew cask install flux
brew cask install google-chrome
brew cask install harvest
brew cask install imagealpha
brew cask install imageoptim
brew cask install libreoffice
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install sequel-pro
brew cask install skype
brew cask install slack
brew cask install telegram
brew cask install toggldesktop
brew cask install transmission
brew cask install virtualbox
brew cask install vlc
brew cask install xld

# set some options for qlcolorcode
defaults write org.n8gray.QLColorCode font Hack
defaults write org.n8gray.QLColorCode fontSizePoints 9
defaults write org.n8gray.QLColorCode hlTheme blacknblue
defaults write org.n8gray.QLColorCode extraHLFlags '--replace-tabs=2'
qlmanage -r

# mac app store installs using mas (brew install mas)
mas install 411246225 # Caffeine
mas install 430798174 # HazeOver
mas install 443987910 # 1Password
mas install 824171161 # Affinity Designer
mas install 824183456 # Affinity Photo
mas install 890031187 # Marked 2

# the rest such as gpg and drivers have to be installed manually
