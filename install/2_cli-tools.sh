#!/usr/bin/env zsh

brew tap homebrew/cask-drivers
brew tap homebrew/services

# install additional brew packages -- see _install.sh too
brew install bat
brew install clipper
brew install fd
brew install ffmpeg
brew install fzf
brew install jump
brew install lazygit
brew install nnn
brew install ripgrep
brew install speedread
brew install spotify-tui
brew install spotifyd
brew install starship
brew install switchaudio-osx
brew install topgrade
brew install tree
brew install viu

# nnn plugins
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

ln -s ~/dotfiles/lazygit ~/.config/lazygit
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/yamllint.yml ~/.config/yamllint/config
ln -s ~/dotfiles/spotifyd.toml ~/.config/spotifyd/spotifyd.conf
ln -s ~/dotfiles/lazygit ~/Library/Application\ Support/lazygit

# other cli tools and helpers
npm install -g diff-so-fancy
npm install -g fkill-cli
pip install tiptop
cargo install bartib

# install fzf
/opt/homebrew/opt/fzf/install

# clipper
mkdir -p ~/Library/LaunchAgents
brew services start clipper
