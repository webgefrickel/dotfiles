#!/usr/bin/env zsh

# Please note: this file is not intended to be 'run and works'.
# It rather is a collection of blocks of cli commands i run in
# sequence to get everything installed on a new macbook. 
# Please configure 'everything apple' and your system-settings 
# to your liking before doing anything else. Then install xcode
# from the app store and proceed.
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
brew tap homebrew/services
brew doctor
brew install fzf neovim lazygit ripgrep zoxide zsh
brew install curl fd git git-delta n openssl pyenv rbenv stow 

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

# ruby, node, python and all the essential tools they provide
n lts
pyenv install 3.12.4 && pyenv global 3.12.4
rbenv install 3.3.4 && rbenv global 3.3.4
pip install setuptools tiptop neovim
npm install -g neovim fkill-cli npm-check trash-cli yarn
gem install neovim

# Custom node scripts and fzf installation
cd ~/Dotfiles/scripts/out && npm i -g
cd ~/Dotfiles/scripts/gallery && npm i -g
/opt/homebrew/opt/fzf/install

# Neomutt and friends
brew install isync msmtp mu neomutt ripmime w3m
pip install urlscan
take Mail && take mailbox && mkdir cur && mkdir new && mkdir tmp
# final steps for a working mutt instance: 
# create the correct keychain-entries in system keychain
# for the mailboxes (compare msmtp/mbsync-config, remember to
# prepend imap-ones with http:// and smtps with smtp://), then:
mbsync -a
mu init -m /Users/webgefrickel/Mail && mu index

# ------------------------------------------------------------- #

# Essential software
brew tap buo/cask-upgrade
brew install blackhole-2ch ffmpeg imagemagick ocrmypdf switchaudio-osx topgrade
brew install --cask font-monaspace-nerd-font 
brew install --cask hammerspoon karabiner-elements raycast syntax-highlight wezterm
brew install --cask carbon-copy-cloner firefox forklift google-chrome 

# Additional software: Communications and multimedia...
brew install --cask microsoft-teams signal telegram whatsapp
brew install --cask affinity-designer affinity-photo reaper tidal vlc

# On demand stuff, work and other tools
# brew install --cask citrix-workspace rapidapi visual-studio-code
# brew install --cask bambu-studio imageoptim kap transmission

# Firefox-extensions, install manually:
# surfingkeys, dark reader, privacy badger, ublock origin,
# react developer tools, df youtube, axe devtools, strongbox autofill

# Apps from the app-store: strongbox, xcode, unifi
# Other software: https://billtheapp.com
