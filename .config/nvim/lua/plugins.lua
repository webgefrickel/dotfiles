return {
  -- The colorscheme of choice
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = 'dark'
      vim.opt.termguicolors = true
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.cmd.colorscheme('gruvbox-material')
      vim.cmd.language('en_US.UTF-8')
    end
  },

  -- Plugins that do not need further configuration
  { 'nvim-lua/plenary.nvim', lazy = true, branch = 'master' },
  { 'echasnovski/mini.nvim',
    config = function()
      require('mini.bracketed').setup()
      require('mini.comment').setup()
      require('mini.diff').setup()
      require('mini.git').setup()
      require('mini.icons').setup()
      require('mini.jump').setup()
      require('mini.splitjoin').setup()
      require('mini.statusline').setup()
      require('mini.surround').setup()
    end
  },
  { 'Exafunction/codeium.nvim', config = true },
  { 'OXY2DEV/markview.nvim', config = true },
  { 'folke/twilight.nvim', config = true },
  { 'kevinhwang91/nvim-bqf', config = true },
  { 'numToStr/Navigator.nvim', config = true },
  { 'nvim-pack/nvim-spectre', config = true,  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'tpope/vim-ragtag' },
}
