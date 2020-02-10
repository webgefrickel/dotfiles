#!/usr/bin/env bash
brew tap buo/cask-upgrade
brew cask install 1password
brew cask install alfred
# brew cask install bill TODO
brew cask install carbon-copy-cloner
brew cask install dash
brew cask install doxie
brew cask install firefox
brew cask install forklift
brew cask install google-chrome
brew cask install hammerspoon
brew cask install imagealpha
brew cask install imageoptim
brew cask install kap
brew cask install karabiner-elements
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install signal
brew cask install sketch
brew cask install skype
brew cask install spotify
brew cask install telegram
brew cask install vlc
brew cask install vmware-fusion

# Drivers and other software
brew tap homebrew/cask-fonts
brew cask install font-fira-code

# set some options for qlcolorcode
defaults write org.n8gray.QLColorCode font "Fira Code"
defaults write org.n8gray.QLColorCode fontSizePoints 9
defaults write org.n8gray.QLColorCode hlTheme blacknblue
defaults write org.n8gray.QLColorCode extraHLFlags '--replace-tabs=2'
qlmanage -r
