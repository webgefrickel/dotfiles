set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('junegunn/fzf', { 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('junegunn/gv.vim')
  call dein#add('mcchrish/nnn.vim')
  call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tpope/vim-apathy')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-eunuch')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-obsession')
  call dein#add('tpope/vim-ragtag')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('w0ng/vim-hybrid')
  call dein#add('wellle/targets.vim')
  call dein#add('wellle/tmux-complete.vim')
  call dein#add('wincent/terminus')

  call dein#end()
  call dein#save_state()
endif

" load the default config and mappings
source ~/.config/nvim/config.vim
source ~/.config/nvim/autocommands.vim
source ~/.config/nvim/statusline.vim
source ~/.config/nvim/keymappings.vim
source ~/.config/nvim/leaderkeys.vim
source ~/.config/nvim/plugins.vim
