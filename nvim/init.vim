call plug#begin('~/.config/nvim/plugged')

" Dependencies for other plugins
Plug 'rktjmp/lush.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vijaymarupudi/nvim-fzf'

" Colorscheme
Plug 'ellisonleao/gruvbox.nvim'

" Plugins
Plug 'christoomey/vim-tmux-navigator'
Plug 'phaazon/hop.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ibhagwan/fzf-lua'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lualine/lualine.nvim'
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
Plug 'windwp/nvim-autopairs'

call plug#end()

" load the default config and mappings
source ~/.config/nvim/config.vim
source ~/.config/nvim/autocommands.vim
source ~/.config/nvim/keymappings.vim
source ~/.config/nvim/leaderkeys.vim
source ~/.config/nvim/plugins.vim
