#!/usr/bin/env bash
brew tap buo/cask-upgrade
brew tap homebrew/cask-fonts

brew install --cask 1password
brew install --cask adoptopenjdk8
brew install --cask alfred
brew install --cask carbon-copy-cloner
brew install --cask dash
brew install --cask doxie
brew install --cask firefox
brew install --cask forklift
brew install --cask google-chrome
brew install --cask hammerspoon
brew install --cask imagealpha
brew install --cask imageoptim
brew install --cask kap
brew install --cask karabiner-elements
brew install --cask microsoft-teams
brew install --cask qlcolorcode
brew install --cask qlstephen
brew install --cask reaper
brew install --cask signal
brew install --cask sketch
brew install --cask skype
brew install --cask spotify
brew install --cask telegram
brew install --cask transmission
brew install --cask vlc
brew install --cask vmware-fusion

# Drivers and other software
brew install --cask font-fira-code
brew install --cask ubiquiti-unifi-controller

# set some options for qlcolorcode
defaults write org.n8gray.QLColorCode font "Fira Code"
defaults write org.n8gray.QLColorCode fontSizePoints 9
defaults write org.n8gray.QLColorCode hlTheme blacknblue
defaults write org.n8gray.QLColorCode extraHLFlags '--replace-tabs=2'

# reload QuickLook and set permissions
sudo xattr -cr ~/Library/QuickLook/*.qlgenerator
qlmanage -r
qlmanage -r cache
