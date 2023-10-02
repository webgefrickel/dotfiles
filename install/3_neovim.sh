#!/usr/bin/env zsh

brew install neovim
gem install neovim
pip install neovim

# link config files
ln -s ~/dotfiles/nvim ~/.config/nvim

# additional language-servers for nvim-lspconfig
npm install -g fixjson
npm install -g eslint_d
npm install -g jsonlint
npm install -g markdownlint-cli
npm install -g neovim
npm install -g stylelint
npm install -g typescript
npm install -g typescript-language-server
npm install -g vscode-langservers-extracted
npm install -g yaml-language-server

pip install yamllint

# packer + treesitter
nvim +TSUpdate
nvim +Lazy
nvim +checkhealth
