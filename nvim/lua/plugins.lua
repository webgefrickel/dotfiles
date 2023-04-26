-- using folke/lazy.nvim as package manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git', '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.api.nvim_set_keymap('n', '<space>', '', {})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup({
  -- The colorscheme of choice
  { 'ellisonleao/gruvbox.nvim', priority = 1000 },

  -- plugins that need no further config/dependencies
  -- oldschool, non-lua plugins
  'AndrewRadev/splitjoin.vim',
  'christoomey/vim-tmux-navigator',
  'editorconfig/editorconfig-vim',
  'tpope/vim-ragtag',
  'tpope/vim-repeat',
  'wincent/terminus',

  -- lua plugins using just the plain default config
  { 'numToStr/Comment.nvim', config = true },
  { 'windwp/nvim-autopairs', config = true },
  { 'lewis6991/gitsigns.nvim', config = true },

  { -- Treesitter for nicer syntax-highlighting
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    init = function() require('config/treesitter') end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  { -- textobjects, surround, for stuff like cs", cib etc.
    'ur4ltz/surround.nvim',
    opts = { mappings_style = 'surround' },
  },

  { -- lsp and null-ls for diagnostics and formatting (eslint_d, stylelint etc.)
    -- remember to install all those tools in the cli, see ../../install/3_vimux.sh
    'neovim/nvim-lspconfig',
    init = function() require('config/lspconfig') end,
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function() require('config/null-ls') end,
  },

  { -- autocompletion and snippets
    'hrsh7th/nvim-cmp',
    dependencies = {
      'andersevenrud/cmp-tmux',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
    },
    init = function() require('config/cmp') end,
  },
  {
    'hrsh7th/vim-vsnip',
    init = function() require('config/vsnip') end,
  },
  {
    'rafamadriz/friendly-snippets',
    dependencies = {
      'hrsh7th/vim-vsnip',
    },
  },

  { -- floating-terminal integration for nnn, lazygit etc.
    'voldikss/vim-floaterm',
    init = function() require('config/floaterm') end,
  },

  { -- fzf integration
    'ibhagwan/fzf-lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    init = function() require('config/fzf') end,
  },

  { -- colorizer for nice css-colors
    'norcalli/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {
      css = { css = true },
      scss = { css = true },
      json = { css = true},
      json5 = { css = true, },
      javascript = { css = true },
    },
  },

  { -- nice status line
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    event = 'VimEnter',
    opts = { options = { theme = 'gruvbox' } },
  },

  { -- leap for stupidly nice navigation
    'ggandor/leap.nvim',
    event = 'BufReadPre',
    init = function() require('leap').set_default_keymaps() end,
  },

  -- Evaluating...
  {
    'rcarriga/nvim-notify',
    init = function() vim.notify = require('notify') end,
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },
})
