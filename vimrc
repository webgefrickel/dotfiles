" my vimrc - this file basically initalies neobundle and loads
" other config files from vim/config + the plugins-subfolder
"======================================================================

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Let Neobundle handle the rest, and start by loading bundles and defaults
source ~/.vim/config/bundles.vim

" end neobundle config
call neobundle#end()

" load the default config and mappings
source ~/.vim/config/defaultconfig.vim
source ~/.vim/config/search.vim
source ~/.vim/config/whitespace.vim
source ~/.vim/config/autocommands.vim
source ~/.vim/config/gui.vim
source ~/.vim/config/tmux.vim
source ~/.vim/config/colorscheme.vim
source ~/.vim/config/keymappings.vim
source ~/.vim/config/leaderkeys.vim

" and the configs and mappings for plugins loaded in bundles.vim
source ~/.vim/config/plugins/fugitive.vim
source ~/.vim/config/plugins/incsearch.vim
source ~/.vim/config/plugins/lightline.vim
source ~/.vim/config/plugins/neocomplete.vim
source ~/.vim/config/plugins/neosnippet.vim
source ~/.vim/config/plugins/syntastic.vim
source ~/.vim/config/plugins/unite.vim
source ~/.vim/config/plugins/sneak.vim
source ~/.vim/config/plugins/wildfire.vim
