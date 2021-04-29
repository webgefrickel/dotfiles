#!/usr/bin/env zsh

brew tap homebrew-ffmpeg/ffmpeg
brew tap homebrew/cask-drivers
brew tap homebrew/services

# install additional brew packages -- see _install.sh too
brew install clipper
brew install fzf
brew install homebrew-ffmpeg/ffmpeg/ffmpeg --with-fdk-aac
brew install htop
brew install jump
brew install lazygit
brew install nnn
brew install ripgrep
brew install tree

# node cli tools and helpers
npm install -g diff-so-fancy
npm install -g fkill-cli
npm install -g pure-prompt

# install fzf
/usr/local/opt/fzf/install

# clipper
mkdir -p ~/Library/LaunchAgents
brew services start clipper

# nnn plugins + trash-cli
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
