#!/usr/bin/env zsh

brew install neovim
brew install tmux
gem install neovim
pip install neovim

# link config files
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

# vim and tmux plugin managers
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# additional language-servers for nvim-lspconfig
npm install -g eslint_d
npm install -g fixjson
npm install -g markdownlint-cli
npm install -g neovim
npm install -g stylelint
npm install -g typescript
npm install -g typescript-language-server
npm install -g vscode-langservers-extracted
npm install -g yaml-language-server

pip install yamllint

# packer + treesitter
nvim +PackerSync +TSUpdate
nvim +checkhealth
