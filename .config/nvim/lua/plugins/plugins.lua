return {
  -- The colorscheme of choice
  { 'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.cmd.colorscheme('gruvbox-material')
      vim.cmd.language('en_US.UTF-8')
    end
  },

  -- commonly used dependencies for lots of other plugins
  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'MunifTanjim/nui.nvim', lazy = true },
  { 'stevearc/dressing.nvim', lazy = true },

  -- file-manager of choice
  { 'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    opts = {
      open_for_directories = true,
      yazi_floating_window_border = 'none',
    },
  },

  -- mini plugins and config
  { 'echasnovski/mini.nvim',
    config = function()
      require('mini.basics').setup()
      require('mini.bracketed').setup()
      require('mini.comment').setup()
      require('mini.diff').setup()
      require('mini.git').setup()
      require('mini.icons').setup()
      require('mini.jump').setup()
      require('mini.move').setup({ options = { reindent_linewise = false }})
      require('mini.splitjoin').setup()
      require('mini.statusline').setup()
      require('mini.surround').setup()
    end
  },

  -- other enhancements, interfaces and better ui
  { 'MagicDuck/grug-far.nvim', opts = {} },
  { 'MeanderingProgrammer/render-markdown.nvim', opts = {} },
  { 'catgoose/nvim-colorizer.lua', event = 'BufReadPre', opts = { tailwind = true } },
  { 'ibhagwan/fzf-lua', opts = { grep = { hidden = true } } },
  { 'kevinhwang91/nvim-bqf', opts = {} },
  { 'numToStr/Navigator.nvim', opts = {} },
  { 'windwp/nvim-ts-autotag', opts = {} },

  -- temp stuff, new corne keyboard ;)
  { 'nvzone/typr', dependencies = 'nvzone/volt', opts = {} }
}
