call plug#begin('~/.config/nvim/plugged')

" Some dependencies and colorscheme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'

" Plugins
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'voldikss/vim-floaterm'
Plug 'wellle/targets.vim'
Plug 'wellle/tmux-complete.vim'
Plug 'wincent/terminus'

" Stuff to try out...
Plug 'akinsho/nvim-bufferline.lua'
Plug 'folke/which-key.nvim'

call plug#end()

" load the default config and mappings
source ~/.config/nvim/config.vim
source ~/.config/nvim/autocommands.vim
source ~/.config/nvim/statusline.vim
source ~/.config/nvim/keymappings.vim
source ~/.config/nvim/leaderkeys.vim
source ~/.config/nvim/plugins.vim
