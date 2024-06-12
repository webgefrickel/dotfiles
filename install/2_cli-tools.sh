#!/usr/bin/env zsh

brew tap homebrew/cask-drivers
brew tap homebrew/services

# install additional brew packages -- see _install.sh too
brew install blackhole-2ch
brew install fd
brew install ffmpeg
brew install fzf
brew install glow
brew install imagemagick
brew install jump
brew install lazygit
brew install ocrmypdf
brew install ripgrep
brew install switchaudio-osx
brew install topgrade

ln -s ~/dotfiles/lazygit ~/.config/lazygit
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/topgrade.toml ~/.config/topgrade.toml

# other cli tools and helpers
npm install -g fkill-cli
npm install -g trash-cli
pip install tiptop

# install fzf
/opt/homebrew/opt/fzf/install

# custom node scripts for audio-switching and jpg-galleries
cd ~/dotfiles/other/out && npm i -g
cd ~/dotfiles/other/gallery && npm i -g
