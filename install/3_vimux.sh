#!/usr/bin/env zsh

brew install neovim --HEAD
brew install tmux
gem install neovim
pip install neovim

# link config files
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

# vim and tmux plugin managers
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# additional language-servers for nvim-lspconfig
npm i -g neovim
npm i -g stylelint-lsp
npm i -g typescript 
npm i -g typescript-language-server
npm i -g vscode-langservers-extracted
npm i -g yaml-language-server

vim +PlugInstall
vim +TSInstall\ bash\ comment\ css\ html\ javascript\ jsdoc\ json\ json5\ lua\ php\ python\ regex\ ruby\ scss\ toml\ tsx\ typescript\ vue\ yaml
vim +PlugUpgrade +PlugUpdate +TSUpdate
vim +checkhealth
