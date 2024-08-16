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

# ruby, node, python and all the essential tools they provide
brew install n pyenv luarocks
pyenv install 3.12.5 && pyenv global 3.12.5
pip install setuptools tiptop neovim urlscan
npm install -g neovim fkill-cli npm-check trash-cli yarn
n lts

# Custom node scripts and fzf installation
cd ~/Dotfiles/scripts/out && npm i -g
cd ~/Dotfiles/scripts/gallery && npm i -g
/opt/homebrew/opt/fzf/install

# Neomutt and friends:create system-keychain-entries for the 
# mailboxes (compare msmtp/mbsync-config, remember to prepend 
# imap-ones with http:// and smtp-ones with smtp://), then:
brew install isync msmtp mu neomutt ripmime w3m
take Mail && take mailbox && mkdir cur new tmp
mbsync -a
mu init -m $HOME/Mail && mu index

# ------------------------------------------------------------- #

# Other essential software
brew tap buo/cask-upgrade
brew install bat fd lazygit git-delta ripgrep topgrade mpv yazi zoxide
brew install ffmpegthumbnailer sevenzip jq poppler font-symbols-only-nerd-font
brew install blackhole-2ch ffmpeg imagemagick ocrmypdf switchaudio-osx
brew install --cask font-monaspace-nerd-font
brew install --cask hammerspoon karabiner-elements raycast wezterm
brew install --cask carbon-copy-cloner firefox google-chrome 

# Additional software: Communications and multimedia...
brew install --cask microsoft-teams signal telegram whatsapp
brew install --cask affinity-designer affinity-photo reaper tidal

# On demand stuff, work and other tools
# brew install --cask forklift transmit
# brew install --cask citrix-workspace rapidapi visual-studio-code
# brew install --cask bambu-studio imageoptim kap transmission

# Firefox-extensions, install manually:
# surfingkeys, dark reader, privacy badger, ublock origin,
# react developer tools, df youtube, axe devtools, strongbox autofill

# Apps from the app-store: strongbox, xcode, unifi
# Other software: https://billtheapp.com
