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
# zsh, neovim, neomutt, yazi, zoxide, lazygit, bat, fzf, 
# wezterm, raycast, karabiner, hammerspoon
# ------------------------------------------------------------- #

xcode-select --install
sudo xcodebuild -license

# set name of new computer
sudo scutil --set ComputerName "mausohr"
sudo scutil --set LocalHostName "mausohr"
sudo scutil --set HostName "mausohr"

# some sane macos-default settings (minimum):
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.Finder AppleShowAllFiles -bool true

# install homebrew and all cli essentials
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
brew tap homebrew/services && brew doctor
brew install curl fzf git neovim openssl stow zsh

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

# node and node-scripts from these dotfiles
brew install n && n lts
npm install -g neovim fkill-cli npm-check trash-cli yarn

# Custom node scripts and fzf installation
cd ~/Dotfiles/scripts/out && npm i -g
cd ~/Dotfiles/scripts/gallery && npm i -g

# Other essential software
brew tap buo/cask-upgrade
brew install bat btop fd lazygit git-delta ripgrep topgrade mpv yazi zoxide
brew install ffmpegthumbnailer sevenzip jq poppler font-symbols-only-nerd-font
brew install blackhole-2ch ffmpeg imagemagick ocrmypdf switchaudio-osx

# update bat to use local gruvbox-material-theme
bat cache --build

# Neomutt and friends:create system-keychain-entries for the 
# mailboxes (compare msmtp/mbsync-config, remember to prepend 
# imap-ones with http:// and smtp-ones with smtp://), then:
brew install isync msmtp mu neomutt ripmime urlscan w3m
take Mail && take mailbox && mkdir cur new tmp
mbsync -a
mu init -m $HOME/Mail && mu index

# ------------------------------------------------------------- #

# Other essential Apps and software
brew install --cask font-monaspace-nerd-font
brew install --cask hammerspoon karabiner-elements raycast wezterm
brew install --cask carbon-copy-cloner firefox google-chrome 

# Additional software: Communications and multimedia...
brew install --cask microsoft-teams signal telegram whatsapp
brew install --cask affinity-designer affinity-photo reaper tidal
brew install --cask mountain-duck shortcat bambu-studio imageoptim kap

# On demand stuff, work and other tools
# brew install --cask forklift transmit bruno sequel-ace transmission
# brew install --cask citrix-workspace visual-studio-code

# Firefox-extensions, install manually (+gruvbox-material-theme):
# surfingkeys, dark reader, privacy badger, ublock origin, tampermonkey,
# react developer tools, df youtube, axe devtools, strongbox autofill

# Apps from the app-store: strongbox, xcode, unifi
# Other software: https://billtheapp.com
