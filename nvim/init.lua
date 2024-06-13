-- ensure that lazy.nvim package manager is installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath })
end

-- minimum starter options and settings before loading plugins/lazy
-- setting leader-key before anything else fixes bugs with lazy.nvim
vim.opt.rtp:prepend(lazypath)
vim.api.nvim_set_keymap('n', '<space>', '', {})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- small helper function for loading external plugin config files
local function c (key)
  return function() require('plugins/' .. key) end
end

require('lazy').setup({
  -- The colorscheme of choice
  { 'luisiacc/gruvbox-baby', priority = 1000 },

  -- Treesitter and LSP
  { 'nvim-treesitter/nvim-treesitter', config = c('treesitter'), build = ':TSUpdate' },
  { 'nvim-treesitter/nvim-treesitter-refactor', dependencies = 'nvim-treesitter/nvim-treesitter' },
  { 'theHamsta/nvim-treesitter-pairs', dependencies = 'nvim-treesitter/nvim-treesitter' },
  { 'Wansmer/treesj', config = true, opts = { use_default_keymaps = false }, dependencies = 'nvim-treesitter/nvim-treesitter' },
  { 'windwp/nvim-ts-autotag', dependencies = 'nvim-treesitter/nvim-treesitter' },
  { 'williamboman/mason.nvim', config = true },
  { 'williamboman/mason-lspconfig.nvim', config = c('mason-lspconfig') }, dependencies = 'williamboman/mason.nvim',
  { 'neovim/nvim-lspconfig' },

  -- Completion, search and snippets
  { 'nvim-telescope/telescope.nvim', config = c('telescope'), dependencies = 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'rafamadriz/friendly-snippets', dependencies = 'hrsh7th/vim-vsnip' },
  { 'hrsh7th/vim-vsnip', config = c('vsnip') },
  { 'hrsh7th/nvim-cmp', config = c('cmp'), dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-calc',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-vsnip',
  }},

  -- editing and movement enhancements
  { 'folke/flash.nvim', config = true },
  { 'kylechui/nvim-surround', config = true },
  { 'numToStr/Comment.nvim', config = true },
  { 'numToStr/Navigator.nvim', config = true },

  -- make vim more beautiful
  { 'nvim-lualine/lualine.nvim', config = c('lualine'), dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'lewis6991/gitsigns.nvim', config = true },
  { 'kevinhwang91/nvim-bqf', config = true },
  { 'rcarriga/nvim-notify', config = function() vim.notify = require('notify') end },
  { 'norcalli/nvim-colorizer.lua', config = c('colorizer'), event = 'VeryLazy' },
  { 'folke/zen-mode.nvim', config = c('zen-mode'), dependencies = 'folke/twilight.nvim' },

  -- other plugins and integrations
  { 'folke/which-key.nvim', config = c('which-key') },
  { 'folke/trouble.nvim', config = true },
  { 'folke/todo-comments.nvim', config = true, dependencies = 'nvim-lua/plenary.nvim' },
  { 'stevearc/oil.nvim', config = c('oil'), dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'nvim-pack/nvim-spectre', config = true, dependencies = 'nvim-lua/plenary.nvim' },
  { 'epwalsh/obsidian.nvim', config = c('obsidian'), ft = 'markdown', dependencies = 'nvim-lua/plenary.nvim' },

  -- Copilot and AI
  { 'zbirenbaum/copilot.lua', config = c('copilot') },
  { 'zbirenbaum/copilot-cmp', config = true },
  { 'CopilotC-Nvim/CopilotChat.nvim', branch = 'canary', config = true, dependencies = { 'zbirenbaum/copilot.lua', 'nvim-lua/plenary.nvim' }},
  { 'Exafunction/codeium.nvim', config = true, dependencies = { 'nvim-lua/plenary.nvim', 'hrsh7th/nvim-cmp' }},
})

-- general sane vim options
vim.opt.breakindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.conceallevel = 2
vim.opt.cursorline = true
vim.opt.foldenable = false
vim.opt.gdefault = true
vim.opt.ignorecase = true
vim.opt.infercase = true
vim.opt.iskeyword:append('-')
vim.opt.list = true
vim.opt.listchars = { extends = '»', precedes = '«', tab = '▸ ', trail = '·'}
vim.opt.relativenumber = true
vim.opt.scrolljump = 5
vim.opt.scrolloff = 3
vim.opt.shortmess:append('cs')
vim.opt.showbreak = '++++'
vim.opt.showmode = false
vim.opt.sidescroll = 10
vim.opt.sidescrolloff = 5
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.virtualedit = 'all'

-- colorscheme and default language
vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.g.gruvbox_baby_telescope_theme = 1
vim.cmd('colorscheme gruvbox-baby')
vim.cmd('language en_US.UTF-8')

-- filetype-specific settings for text-files
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.md', '*.markdown', '*.rst', '*.txt', 'neomutt-*', '*.mail' },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { 'de', 'en' }
    vim.opt_local.wrap = true
    vim.opt_local.textwidth = 70
    vim.opt_local.formatoptions:append('q')
  end
})

-- filetype-specific settings for mails
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { 'neomutt-*', '*.mail' },
  callback = function()
    vim.opt_local.filetype = 'mail'
    vim.opt_local.comments:append('nb:>')
    vim.opt_local.formatoptions:append('aw')
  end,
})
