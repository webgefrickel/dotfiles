#!/usr/bin/env zsh

brew tap homebrew/services
brew tap homebrew-ffmpeg/ffmpeg

# install additional brew packages -- see _install.sh too
brew install clipper
brew install fzf
brew install homebrew-ffmpeg/ffmpeg/ffmpeg --with-fdk-aac
brew install htop
brew install jump
brew install nnn
brew install ripgrep
brew install switchaudio-osx
brew install tree

# node cli tools and helpers
npm install -g diff-so-fancy
npm install -g fkill-cli
npm install -g npm-check
npm install -g pure-prompt
npm install -g yarn

# install fzf
/usr/local/opt/fzf/install

# clipper
mkdir -p ~/Library/LaunchAgents
brew services start clipper

# nnn plugins + trash-cli
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
