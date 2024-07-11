#!/usr/bin/env zsh

brew tap homebrew/cask-drivers
brew tap homebrew/services

# install additional brew packages -- see _install.sh too
brew install blackhole-2ch
brew install fd
brew install ffmpeg
brew install fzf
brew install git-delta
brew install imagemagick
brew install lazygit
brew install ocrmypdf
brew install ripgrep
brew install switchaudio-osx
brew install topgrade
brew install zoxide

# other cli tools and helpers
npm install -g fkill-cli
npm install -g trash-cli
pip install tiptop

# install fzf
/opt/homebrew/opt/fzf/install

# custom node scripts for audio-switching and jpg-galleries
cd ~/Dotfiles/scripts/out && npm i -g
cd ~/Dotfiles/scripts/gallery && npm i -g
