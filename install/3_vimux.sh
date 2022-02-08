#!/usr/bin/env zsh

brew install neovim --HEAD
brew install tmux
gem install neovim
pip install neovim
pip install yamllint

# link config files
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

# vim and tmux plugin managers
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# additional language-servers for nvim-lspconfig
npm i -g eslint_d
npm i -g markdownlint-cli
npm i -g fixjson
npm i -g neovim
npm i -g typescript
npm i -g typescript-language-server
npm i -g vscode-langservers-extracted
npm i -g yaml-language-server

# packer + treesitter
nvim +PackerSync +TSUpdate
nvim +checkhealth
