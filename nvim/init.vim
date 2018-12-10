language en_US.UTF-8
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" let dein handle all the plugins and bundles
call dein#begin(expand('~/.config/nvim/dein'))
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neosnippet')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('junegunn/fzf', { 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('junegunn/gv.vim')
  call dein#add('maxbrunsfeld/vim-yankstack')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-eunuch')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-ragtag')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-vinegar')
  call dein#add('w0ng/vim-hybrid')
  call dein#add('w0rp/ale')
  call dein#add('webgefrickel/vim-snippets')
  call dein#add('wellle/targets.vim')
  call dein#add('wellle/tmux-complete.vim')
  call dein#add('wincent/terminus')
call dein#end()

" load the default config and mappings
source ~/.config/nvim/config.vim
source ~/.config/nvim/autocommands.vim
source ~/.config/nvim/statusline.vim
source ~/.config/nvim/keymappings.vim
source ~/.config/nvim/leaderkeys.vim
source ~/.config/nvim/plugins.vim
