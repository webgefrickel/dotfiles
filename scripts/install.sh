#!/usr/bin/env zsh

# Please note: this file is not intended to be 'run and works'.
# It rather is a collection of blocks of cli commands i run in
# sequence to get everything installed on a new macbook. 
# Please configure 'everything apple' and your system-settings 
# to your liking before doing anything else. Then install xcode
# from the app store and proceed.
#
# Everything is highly to my liking/randomly working setup and
# really to be used without me sitting next to you... wait! I 
# can explain... ;)
#
# Buzzwords:
# zsh, neovim, neomutt, yazi, zoxide, lazygit, bat, 
# fzf, wezterm, raycast, karabiner
# ------------------------------------------------------------- #

xcode-select --install
sudo xcodebuild -license accept

# set name of new computer
sudo scutil --set ComputerName "mausohr"
sudo scutil --set LocalHostName "mausohr"
sudo scutil --set HostName "mausohr"

# some sane macos-default settings (minimum):
defaults write -g InitialKeyRepeat -int 12
defaults write -g KeyRepeat -int 2
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.Finder AppleShowAllFiles -bool true

# install homebrew and all brewfile dependencies
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
cd ~/dotfiles/scripts
brew doctor && brew bundle install

# good idea to kill terminal now and proceed...
# ------------------------------------------------------------- #

# stow everything, link dotfiles, set zsh as default and restart
cd ~/dotfiles && stow .
sudo vim /etc/shells
chsh -s /opt/homebrew/bin/zsh
/usr/bin/env zsh
sudo launchctl config user path $PATH
autoload -Uz compinit
compinit
exit

# ------------------------------------------------------------- #

# node, global tools and custom scripts
n lts
npm install -g fkill-cli neovim npm npm-check trash-cli yarn
cd ~/Dotfiles/scripts/gallery && npm i -g

# some plugins and additional things to do 
# (launch vim, install everything with lazy/mason...)
bat cache --build
ya pack -a yazi-rs/plugins:full-border

# Neomutt and friends:create system-keychain-entries for the 
# mailboxes (compare msmtp/mbsync-config, remember to prepend 
# imap-ones with http:// and smtp-ones with smtp://), then:
take Mail && take mailbox && mkdir cur new tmp
mbsync -a
mu init -m $HOME/Mail && mu index

# ------------------------------------------------------------- #

# librewolf / firefox-extensions, install manually:
# surfingkeys, privacy badger, ublock origin, react devtools, 
# df youtube, axe devtools, strongbox autofill and gruvbox material dark

# Apps from the app-store: hazeover, strongbox, xcode, unifi
# Other software: https://billtheapp.com
