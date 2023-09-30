-- small helper function for loading external plugin config files
local function get_config (key)
  return function() require('config/' .. key) end
end

-- ensure folke/lazy.nvim is being loaded
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to set mapleader before lazy.nvim so your mappings are correct
vim.api.nvim_set_keymap('n', '<space>', '', {})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup({
  -- The colorscheme of choice
  { 'luisiacc/gruvbox-baby', priority = 1000 },

  -- modern neovim with treesitter + refactor/objects, lsp,
  -- floaterm-integration (nnn, lazygit...)
  -- telescope and cmp as completion engine, vsnip-support
  { 'voldikss/vim-floaterm', init = get_config('floaterm') },
  { 'nvim-treesitter/nvim-treesitter', init = get_config('treesitter'), build = ':TSUpdate' },
  { 'nvim-treesitter/nvim-treesitter-textobjects', dependencies = { 'nvim-treesitter/nvim-treesitter' } },
  { 'nvim-treesitter/nvim-treesitter-refactor', dependencies = { 'nvim-treesitter/nvim-treesitter' } },

  { 'neovim/nvim-lspconfig', init = get_config('lspconfig') },
  { 'nvim-telescope/telescope.nvim', init = get_config('telescope'), dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'hrsh7th/vim-vsnip', init = get_config('vsnip') },
  { 'rafamadriz/friendly-snippets', dependencies = { 'hrsh7th/vim-vsnip' } },
  {
    'hrsh7th/nvim-cmp',
    init = get_config('cmp'),
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
    },
  },

  -- TODO replace null-ls with nvim-lint
  { 'jose-elias-alvarez/null-ls.nvim', init = get_config('null-ls'), dependencies = { 'nvim-lua/plenary.nvim' } },


  -- editing / moving enhancements
  { 'AndrewRadev/splitjoin.vim' },
  { 'numToStr/Comment.nvim', config = true },
  { 'numToStr/Navigator.nvim', config = true },
  { 'tpope/vim-ragtag' },
  { 'tpope/vim-repeat' },
  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = true },
  { 'kylechui/nvim-surround', event = 'VeryLazy', config = true },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    -- TODO use whichkey for key mappings everywhere, one single init.lua ?!
    keys = {
      { 's', mode = { 'n', 'o', 'x' }, function() require('flash').jump() end, desc = 'Flash' },
      { 'S', mode = { 'n', 'o', 'x' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
    },
  },

  -- interface/code-navigation enhancements, git and others
  { 'lewis6991/gitsigns.nvim', config = true },
  { 'kevinhwang91/nvim-bqf', config = true },
  { 'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      sections = {
        lualine_b = { 'branch' },
        lualine_x = {},
        lualine_y = { 'diff', 'diagnostics' },
      },
      options = {
        theme = 'gruvbox'
      }
    },
  },
  { 'norcalli/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {
      css = { css = true },
      scss = { css = true },
      json = { css = true},
      json5 = { css = true, },
      javascript = { css = true },
    },
  },

  -- and neorg for todo-lists etc.
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    opts = {
      load = {
        ['core.concealer'] = {},
        ['core.defaults'] = {},
        ['core.dirman'] = {
          config = {
            default_workspace = 'notes',
            workspaces = {
              notes = '~/Notes',
            },
          },
        },
      },
    },
    dependencies = { { 'nvim-lua/plenary.nvim' } },
  },

  -- investigating...
  {
    'jackMort/ChatGPT.nvim',
    event = 'VeryLazy',
    config = true,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    }
  },
  {
    'folke/zen-mode.nvim',
    dependencies = { 'folke/twilight.nvim' },
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        height = 0.85,
      },
      plugins = {
        gitsigns = { enabled = true },
      },
    },
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
})
