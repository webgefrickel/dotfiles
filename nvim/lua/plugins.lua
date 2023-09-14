-- small helper function for loading external plugin config files
local function get_config (key)
  return function() require('config/' .. key) end
end

-- ensure folke/lazy.nvim is being loaded
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to set mapleader before lazy.nvim so your mappings are correct
vim.api.nvim_set_keymap('n', '<space>', '', {})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup({
  -- The colorscheme of choice
  { 'luisiacc/gruvbox-baby', priority = 1000 },

  -- core pieces: telescope & fzf/terminal/tmux integration,
  -- completion-engine + snippets
  { 'voldikss/vim-floaterm', init = get_config('floaterm') },
  { 'wincent/terminus' },
  { 'christoomey/vim-tmux-navigator'},
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    init = get_config('telescope'),
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'hrsh7th/vim-vsnip', init = get_config('vsnip') },
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
      'hrsh7th/cmp-vsnip',
    },
  },
  { 'rafamadriz/friendly-snippets', dependencies = { 'hrsh7th/vim-vsnip' } },

  -- more modern neovim with treesitter, lsp, auto-setup and
  -- null-ls integration; see ../../install/3_vimux.sh
  -- and null-ls-config for installed and supported tools (Eslint, TSC etc.)
  { 'nvim-treesitter/nvim-treesitter', init = get_config('treesitter'), build = ':TSUpdate' },
  { 'neovim/nvim-lspconfig', init = get_config('lspconfig') },
  { 'jose-elias-alvarez/null-ls.nvim', init = get_config('null-ls'), dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'editorconfig/editorconfig-vim' },

  -- editing enhancements
  { 'AndrewRadev/splitjoin.vim' },
  { 'numToStr/Comment.nvim', config = true },
  { 'tpope/vim-ragtag' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-surround' },
  { 'windwp/nvim-autopairs', config = true },

  -- interface/code-navigation enhancements, git and others
  { 'lewis6991/gitsigns.nvim', config = true },
  { 'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = { options = { theme = 'gruvbox' } },
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
  { 'kevinhwang91/nvim-bqf', config = true },
  {
    "piersolenski/wtf.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "gw",
        mode = { "n" },
        function()
          require("wtf").ai()
        end,
        desc = "Debug diagnostic with AI",
      },
      {
        mode = { "n" },
        "gW",
        function()
          require("wtf").search()
        end,
        desc = "Search diagnostic with Google",
      },
    },
  },
  {
    'jackMort/ChatGPT.nvim',
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  {
    'folke/zen-mode.nvim',
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        height = 0.85,
      },
      plugins = {
        gitsigns = { enabled = true },
        tmux = { enabled = true },
      },
    },
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    keys = {
      { 's', mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
      { 'S', mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { 'Q', mode = { "n", "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
})
