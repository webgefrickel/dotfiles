#!/usr/bin/env zsh
brew tap buo/cask-upgrade
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions

# font of choice
brew install --cask font-monaspace-nerd-font

# default software
brew install --cask affinity-designer
brew install --cask affinity-photo
brew install --cask alfred
brew install --cask carbon-copy-cloner
brew install --cask firefox
brew install --cask forklift
brew install --cask google-chrome
brew install --cask hammerspoon
brew install --cask karabiner-elements
brew install --cask microsoft-teams
brew install --cask signal
brew install --cask syntax-highlight
brew install --cask telegram
brew install --cask vlc
brew install --cask wezterm

# on demand, when needed
# brew install --cask citrix-workspace
# brew install --cask kap
# brew install --cask rapidapi
# brew install --cask reaper
# brew install --cask visual-studio-code

ln -s ~/dotfiles/hammerspoon ~/.hammerspoon
ln -s ~/dotfiles/karabiner ~/.config/karabiner

# Drivers and other software

# firefox-extensions: 
# surfingkeys, dark reader, privacy badger, ublock origin, 
# react developer tools, df youtube, axe devtools 

# other software that can't be installed via brew:
# bill: https://billtheapp.com/

# Apps from the app-store: strongbox, xcode, unifi
