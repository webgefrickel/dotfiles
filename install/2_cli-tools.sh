#!/usr/bin/env zsh

brew tap homebrew-ffmpeg/ffmpeg
brew tap homebrew/cask-drivers
brew tap homebrew/services

# install additional brew packages -- see _install.sh too
brew install bat
brew install clipper
brew install fd
brew install fzf
brew install glances
brew install homebrew-ffmpeg/ffmpeg/ffmpeg --with-fdk-aac --with-rav1e
brew install jump
brew install lazygit
brew install nnn
brew install ripgrep
brew install starship
brew install tree
brew install viu

# nnn plugins
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

ln -s ~/dotfiles/lazygit ~/.config/lazygit
ln -s ~/Dotfiles/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/lazygit ~/Library/Application\ Support/lazygit

# node cli tools and helpers
npm install -g diff-so-fancy
npm install -g fkill-cli

# install fzf
/opt/homebrew/opt/fzf/install

# clipper
mkdir -p ~/Library/LaunchAgents
brew services start clipper
