if &compatible
  set nocompatible
endif

set langmenu=en_US.UTF-8
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" let dein handle all the plugins and bundles
call dein#begin(expand('~/.config/nvim/dein'))
call dein#add('Shougo/dein.vim')
source ~/.config/nvim/bundles.vim
call dein#end()

filetype plugin indent on
syntax on

" load the default config and mappings
source ~/.config/nvim/config.vim
source ~/.config/nvim/autocommands.vim
source ~/.config/nvim/keymappings.vim
source ~/.config/nvim/leaderkeys.vim
source ~/.config/nvim/plugins.vim
