" my vimrc - this file basically initalies neobundle and loads
" other config files from vim/config + the plugins-subfolder
"======================================================================

set langmenu=en_US.UTF-8
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.config/nvim/dein'))
source ~/.config/nvim/bundles.vim
call dein#end()

" load the default config and mappings
source ~/.config/nvim/defaultconfig.vim
source ~/.config/nvim/search.vim
source ~/.config/nvim/whitespace.vim
source ~/.config/nvim/autocommands.vim
source ~/.config/nvim/colorscheme.vim
source ~/.config/nvim/keymappings.vim
source ~/.config/nvim/leaderkeys.vim

" and the configs and mappings for plugins loaded in bundles.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/incsearch.vim
source ~/.config/nvim/plugins/lightline.vim
" source ~/.config/nvim/plugins/neosnippet.vim
" source ~/.config/nvim/plugins/neocomplete.vim
source ~/.config/nvim/plugins/sneak.vim
source ~/.config/nvim/plugins/syntastic.vim
" source ~/.config/nvim/plugins/unite.vim
