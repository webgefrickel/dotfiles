#!/usr/bin/env zsh
brew tap buo/cask-upgrade
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions

brew install --cask 1password
brew install --cask alfred
brew install --cask carbon-copy-cloner
brew install --cask dash
brew install --cask firefox
brew install --cask forklift
brew install --cask google-chrome
brew install --cask hammerspoon
brew install --cask iina
brew install --cask iterm2
brew install --cask kap
brew install --cask karabiner-elements
brew install --cask microsoft-teams
brew install --cask qlstephen
brew install --cask reaper
brew install --cask sequel-pro
brew install --cask signal
brew install --cask spotify
brew install --cask syntax-highlight
brew install --cask telegram
brew install --cask temurin8
brew install --cask vmware-fusion
brew install --cask zoom

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
brew install --cask ubiquiti-unifi-controller

# Tell unifi-controller to use brew-installed java
sudo ln -s /Library/Java/JavaVirtualMachines/temurin-8.jdk /Applications/UniFi.app/Contents/PlugIns/temurin-8.jdk
sudo v /Applications/UniFi.app/Contents/Info.plist
# THEN add this: <key>JVMRuntime</key> <string>temurin-8.jdk</string>

# firefox-extensions: 
# surfingkeys, dark reader, privacy badger, ublock origin, wikiwand,
# 1passwd classic extension, react developer tools, df youtube

# other software:
# bill: https://billtheapp.com/
# citrix: https://www.citrix.com/downloads/workspace-app/mac/workspace-app-for-mac-latest.html
