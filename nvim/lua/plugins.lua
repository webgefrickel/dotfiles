-- using folke/lazy.nvim as package manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- small helper function for loading external plugin config files
local function get_config (key)
  return function() require('config/' .. key) end
end

-- ensure lazy being loaded
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git', '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Make sure to set mapleader before lazy.nvim so your mappings are correct
vim.api.nvim_set_keymap('n', '<space>', '', {})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup({
  -- The colorscheme of choice
  { 'ellisonleao/gruvbox.nvim', priority = 1000 },

  -- TODO: telescope vs. fzf integration
  -- modern neovim with treesitter, lsp, null-ls and cmp
  -- remember to install all those tools since we do not use mason
  -- see ../../install/3_vimux.sh
  { 'neovim/nvim-lspconfig', init = get_config('lspconfig') },
  {
    'nvim-treesitter/nvim-treesitter',
    init = get_config('treesitter'),
    build = ':TSUpdate',
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    init = get_config('null-ls'),
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'hrsh7th/nvim-cmp',
    init = get_config('cmp'),
    dependencies = {
      'andersevenrud/cmp-tmux',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip', -- see snippet engine of choice below
    },
  },

  -- snippet engine of choice
  { 'hrsh7th/vim-vsnip', init = get_config('vsnip') },
  { 'rafamadriz/friendly-snippets', dependencies = { 'hrsh7th/vim-vsnip' } },

  -- editing enhancements
  { 'AndrewRadev/splitjoin.vim' },
  { 'echasnovski/mini.ai', version = '*' },
  { 'numToStr/Comment.nvim', config = true },
  { 'tpope/vim-ragtag' },
  { 'tpope/vim-repeat' },
  { 'ur4ltz/surround.nvim', opts = { mappings_style = 'surround' } },
  { 'windwp/nvim-autopairs', config = true },

  -- git and other external tools integration
  { 'christoomey/vim-tmux-navigator'},
  { 'editorconfig/editorconfig-vim' },
  { 'ibhagwan/fzf-lua', dependencies = { 'kyazdani42/nvim-web-devicons' }, init = get_config('fzf') },
  { 'lewis6991/gitsigns.nvim', config = true },
  { 'voldikss/vim-floaterm', init = get_config('floaterm') },
  { 'wincent/terminus' },

  -- ui enhancements / navigation
  {  -- nice popup messages
    'rcarriga/nvim-notify',
    init = function() vim.notify = require('notify') end
  },
  { -- a nice status line
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    event = 'VimEnter',
    opts = { options = { theme = 'gruvbox' } },
  },
  { -- easy jump navigation
    'ggandor/leap.nvim',
    event = 'BufReadPre',
    init = function() require('leap').set_default_keymaps() end,
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

  -- Evaluating...
  { 'folke/trouble.nvim', dependencies = { 'kyazdani42/nvim-web-devicons' } },
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
})
