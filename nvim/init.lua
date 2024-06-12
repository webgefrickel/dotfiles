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
  { 'Wansmer/treesj', config = true, opts = { use_default_keymaps = false },
  { 'windwp/nvim-ts-autotag', dependencies = 'nvim-treesitter/nvim-treesitter' },
    dependencies = 'nvim-treesitter/nvim-treesitter' },
  { 'williamboman/mason.nvim', config = true },
  { 'williamboman/mason-lspconfig.nvim', dependencies = 'williamboman/mason.nvim', config = c('mason-lspconfig') },
  { 'neovim/nvim-lspconfig' },

  -- CMP completion and snippets
  { 'nvim-telescope/telescope.nvim', config = c('telescope'), dependencies = 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'hrsh7th/vim-vsnip', config = c('vsnip') },
  { 'rafamadriz/friendly-snippets', dependencies = 'hrsh7th/vim-vsnip' },
  { 'hrsh7th/nvim-cmp', config = c('cmp'),
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
    },
  },

  -- interface, editing and movement enhancements
  { 'folke/flash.nvim', config = true },
  { 'folke/which-key.nvim', config = c('which-key') },
  { 'folke/zen-mode.nvim', dependencies = 'folke/twilight.nvim', config = c('zen-mode') },
  { 'kevinhwang91/nvim-bqf', config = true },
  { 'kylechui/nvim-surround', config = true },
  { 'lewis6991/gitsigns.nvim', config = true },
  { 'norcalli/nvim-colorizer.lua', config = c('colorizer'), event = 'VeryLazy' },
  { 'numToStr/Comment.nvim', config = true },
  { 'numToStr/Navigator.nvim', config = true },
  { 'nvim-lualine/lualine.nvim', dependencies = 'nvim-tree/nvim-web-devicons', config = c('lualine') },
  { 'rcarriga/nvim-notify', config = function() vim.notify = require('notify') end },

  -- more plugins and integrations
  { 'folke/todo-comments.nvim', dependencies = { "nvim-lua/plenary.nvim" }, config = true },
  { 'folke/trouble.nvim', config = true },
  { 'stevearc/oil.nvim', config = c('oil'), dependencies = { 'nvim-tree/nvim-web-devicons' } },
  { 'nvim-pack/nvim-spectre', dependencies = 'nvim-lua/plenary.nvim', config = true },
  { 'epwalsh/obsidian.nvim', version = '*', lazy = true, ft = 'markdown',
    dependencies = { 'nvim-lua/plenary.nvim' }, opts = { dir = '~/Notes' },
  },

  -- Copilot and other AI tools
  { 'zbirenbaum/copilot.lua', config = c('copilot') },
  { 'zbirenbaum/copilot-cmp', config = true },
  { 'Exafunction/codeium.nvim', config = true,
    dependencies = { 'nvim-lua/plenary.nvim', 'hrsh7th/nvim-cmp' },
  },
  { 'CopilotC-Nvim/CopilotChat.nvim', branch = 'canary', config = true,
    dependencies = { { 'zbirenbaum/copilot.lua' }, { 'nvim-lua/plenary.nvim' } },
  },
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
