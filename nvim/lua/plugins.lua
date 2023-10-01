-- small helper function for loading external plugin config files
local function get_config (key)
  return function() require('config/' .. key) end
end

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath })
end

-- minimum starter options and settings before loading plugins
vim.api.nvim_set_keymap('n', '<space>', '', {})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_python_provider = 0
vim.g.loaded_perl_provider = 0
vim.opt.rtp:prepend(lazypath)
vim.opt.background = 'dark'
vim.opt.termguicolors = true

require('lazy').setup({
  -- The colorscheme of choice
  { 'luisiacc/gruvbox-baby', priority = 1000 },

  -- modern neovim with treesitter, lsp, cmp, vsnips and telescope
  { 'neovim/nvim-lspconfig', config = get_config('lspconfig') },
  { 'nvim-treesitter/nvim-treesitter', config = get_config('treesitter'), build = ':TSUpdate' },
  { 'nvim-treesitter/nvim-treesitter-textobjects', dependencies = 'nvim-treesitter/nvim-treesitter' },
  { 'nvim-treesitter/nvim-treesitter-refactor', dependencies = 'nvim-treesitter/nvim-treesitter' },
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
  { 'folke/which-key.nvim', event = 'VeryLazy', config = true },
  { 'folke/zen-mode.nvim', dependencies = 'folke/twilight.nvim', config = get_config('zen-mode') },
  { 'kevinhwang91/nvim-bqf', config = true },
  { 'lewis6991/gitsigns.nvim', config = true },
  { 'norcalli/nvim-colorizer.lua', event = 'BufReadPre', config = get_config('colorizer') },
  { 'nvim-lualine/lualine.nvim', dependencies = 'nvim-tree/nvim-web-devicons', config = get_config('lualine') },

  -- editing / movement enhancements
  { 'AndrewRadev/splitjoin.vim' },
  { 'folke/flash.nvim', event = 'VeryLazy', config = true },
  { 'kylechui/nvim-surround', event = 'VeryLazy', config = true },
  { 'numToStr/Comment.nvim', config = true },
  { 'numToStr/Navigator.nvim', config = true },
  { 'tpope/vim-ragtag' }, -- TODO still needed?!
  { 'tpope/vim-repeat' }, -- TODO still needed?!
  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = true },

  -- more plugins and integrations
  { 'voldikss/vim-floaterm', config = get_config('floaterm') },
  { 'mfussenegger/nvim-lint', config = get_config('lint') },
  -- TODO replace null-ls with formatter ?!
  { 'jose-elias-alvarez/null-ls.nvim', config = get_config('null-ls'), dependencies = 'nvim-lua/plenary.nvim' },
  { 'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = 'nvim-lua/plenary.nvim',
    config = get_config('neorg'),
  },
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
