#!/usr/bin/env zsh
brew tap buo/cask-upgrade
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions

brew install --cask alfred
brew install --cask carbon-copy-cloner
brew install --cask firefox
brew install --cask forklift
brew install --cask google-chrome
brew install --cask hammerspoon
brew install --cask iina
brew install --cask imageoptim
brew install --cask iterm2
brew install --cask kap
brew install --cask karabiner-elements
brew install --cask microsoft-teams
brew install --cask reaper
brew install --cask signal
brew install --cask syntax-highlight
brew install --cask telegram

# seldomly used software
#brew install --cask paw
#brew install --cask sequel-pro
#brew install --cask sketch
#brew install --cask transmission
#brew install --cask vmware-fusion

# Quicklook-reset
xattr -cr ~/Library/QuickLook
xattr -d -r com.apple.quarantine ~/Library/QuickLook
qlmanage -r
qlmanage -r cache

# link config files for some casks
ln -s ~/dotfiles/hammerspoon ~/.hammerspoon
ln -s ~/dotfiles/karabiner ~/.config/karabiner

# Drivers and other software
brew install --cask font-fira-code-nerd-font

# firefox-extensions: 
# surfingkeys, dark reader, privacy badger, ublock origin, 
# react developer tools, df youtube, axe devtools 

# other software:
# bill: https://billtheapp.com/
# citrix: https://www.citrix.com/downloads/workspace-app/mac/workspace-app-for-mac-latest.html
