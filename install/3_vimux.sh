#!/usr/bin/env zsh

brew install neovim --HEAD
brew install tmux

# vim dependencies
gem install neovim
pip install neovim
npm install -g neovim

# link config files
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

# vim and tmux plugin managers
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

vim +PlugInstall
vim +CocInstall\ coc-calc\ coc-css\ coc-eslint\ coc-html\ coc-json\ coc-markdownlint\ coc-pairs\ coc-phpls\ coc-snippets\ coc-stylelintplus\ coc-tsserver\ coc-yaml\ coc-yank
vim +TSInstall\ bash\ comment\ css\ dockerfile\ graphql\ html\ javascript\ jsdoc\ json\ jsonc\ lua\ php\ python\ regex\ scss\ tsx\ typescript\ vue\ yaml
vim +CocUpdate +PlugUpgrade +PlugUpdate +TSUpdate
vim +checkhealth
