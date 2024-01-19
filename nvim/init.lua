-- small helper function for loading external plugin config files
local g = vim.g
local set = vim.opt
local setlocal = vim.opt_local
local createCmd = vim.api.nvim_create_autocmd
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

local function get_config (key)
  return function() require('plugins/' .. key) end
end

-- ensure that lazy.nvim package manager is installed
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath })
end

-- minimum starter options and settings before loading plugins
set.rtp:prepend(lazypath)
vim.api.nvim_set_keymap('n', '<space>', '', {})
g.mapleader = ' '
g.maplocalleader = ' '

require('lazy').setup({
  -- The colorscheme of choice
  { 'luisiacc/gruvbox-baby', priority = 1000 },

  -- modern neovim with treesitter, lsp, cmp, vsnips and telescope
  { 'neovim/nvim-lspconfig', config = get_config('lspconfig') },
  { 'nvim-treesitter/nvim-treesitter', config = get_config('treesitter'), build = ':TSUpdate' },
  { 'nvim-treesitter/nvim-treesitter-refactor', dependencies = 'nvim-treesitter/nvim-treesitter' },
  { 'windwp/nvim-ts-autotag', dependencies = 'nvim-treesitter/nvim-treesitter' },
  { 'andymass/vim-matchup', dependencies = 'nvim-treesitter/nvim-treesitter' },
  { 'nvim-telescope/telescope.nvim', dependencies = 'nvim-lua/plenary.nvim', config = get_config('telescope')  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'hrsh7th/vim-vsnip', config = get_config('vsnip') },
  { 'rafamadriz/friendly-snippets', dependencies = 'hrsh7th/vim-vsnip' },
  { 'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
    },
    config = get_config('cmp'),
  },

  -- interface enhancements
  { 'folke/which-key.nvim', event = 'VeryLazy', config = get_config('which-key') },
  { 'folke/zen-mode.nvim', dependencies = 'folke/twilight.nvim', config = get_config('zen-mode') },
  { 'kevinhwang91/nvim-bqf', config = true },
  { 'lewis6991/gitsigns.nvim', config = true },
  { 'norcalli/nvim-colorizer.lua', event = 'BufReadPre', config = get_config('colorizer') },
  { 'nvim-lualine/lualine.nvim', dependencies = 'nvim-tree/nvim-web-devicons', config = get_config('lualine') },

  -- editing / movement enhancements
  { 'Wansmer/treesj', dependencies = 'nvim-treesitter/nvim-treesitter', config = true },
  { 'folke/flash.nvim', event = 'VeryLazy', config = true },
  { 'kylechui/nvim-surround', event = 'VeryLazy', config = true },
  { 'numToStr/Comment.nvim', config = true },
  { 'numToStr/Navigator.nvim', config = true },
  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = true },

  -- more plugins and integrations
  { 'nvim-pack/nvim-spectre', dependencies = 'nvim-lua/plenary.nvim', config = true },
  { 'voldikss/vim-floaterm', config = get_config('floaterm') },
  { 'mfussenegger/nvim-lint', config = get_config('lint') },
  { 'stevearc/conform.nvim', event = 'BufWritePre', config = get_config('conform') },
  { 'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = 'nvim-lua/plenary.nvim',
    config = get_config('neorg'),
  },
  { 'github/copilot.vim' },
  -- { 'zbirenbaum/copilot.lua', event = 'InsertEnter', config = get_config('copilot') },
  -- { 'zbirenbaum/copilot-cmp', config = true },
  { 'jackMort/ChatGPT.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    },
    config = true,
  },
})

-- general sane vim options
set.breakindent = true
set.clipboard = 'unnamedplus'
set.cmdheight = 1
set.completeopt = { 'menu', 'menuone', 'noselect' }
set.conceallevel = 2
set.cpoptions:append('$')
set.cursorline = true
set.foldmethod = 'expr'
set.gdefault = true
set.grepprg = 'rg'
set.hidden = true
set.ignorecase = true
set.infercase = true
set.laststatus = 3
set.lazyredraw = true
set.list = true
set.listchars = { extends = '»', precedes = '«', tab = '▸ ', trail = '·'}
set.foldenable = false
set.showmode = false
set.swapfile = false
set.wrap = false
set.writebackup = false
set.relativenumber = true
set.scrolljump = 5
set.scrolloff = 3
set.shiftround = true
set.shiftwidth = 2
set.shortmess:append('c')
set.showbreak = '\\\\\\\\'
set.showmatch = true
set.sidescroll = 10
set.sidescrolloff = 5
set.smartcase = true
set.splitright = true
set.splitbelow = true
set.updatetime = 300
set.virtualedit = 'all'
set.visualbell = true
set.wildmode = { 'list:longest', 'list:full' }
g.loaded_python_provider = 0
g.loaded_perl_provider = 0

-- colorscheme and default language
set.background = 'dark'
set.termguicolors = true
g.gruvbox_baby_telescope_theme = 1
vim.cmd('colorscheme gruvbox-baby')
vim.cmd('language en_US.UTF-8')

-- autoresize windows/splits everytime we change to a buffer
createCmd({ 'VimResized', 'FocusGained' }, {
  pattern = { '*' },
  command = 'wincmd =',
})

-- make dash-spearated-keywords in css and json a keyword
createCmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.css', '*.scss', '*.json' },
  callback = function() setlocal.iskeyword:append('-') end,
})

-- filetype-specific settings for text-files
createCmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.md', '*.markdown', '*.rst', '*.txt', 'neomutt-*', '*.mail' },
  callback = function()
    setlocal.spell = true
    setlocal.spelllang = { 'de', 'en' }
    setlocal.wrap = true
    setlocal.textwidth = 70
    setlocal.formatoptions:append('q')
  end,
})

-- filetype-specific settings for mails
createCmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { 'neomutt-*', '*.mail' },
  callback = function()
    setlocal.filetype = 'mail'
    setlocal.comments:append('nb:>')
    setlocal.formatoptions:append('aw')
  end,
})
