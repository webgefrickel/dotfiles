return {
  { 'MeanderingProgrammer/markdown.nvim', config = true },
  { 'lewis6991/gitsigns.nvim', config = true },
  { 'kevinhwang91/nvim-bqf', config = true },
  { 'nvim-pack/nvim-spectre', config = true,  },
  { 'folke/trouble.nvim', config = true },
  { 'folke/todo-comments.nvim', config = true },
  { 'norcalli/nvim-colorizer.lua',
    opts = {
      css = { css = true },
      scss = { css = true },
      json = { css = true},
      javascript = { css = true },
    },
  },
  { 'folke/zen-mode.nvim',
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        height = 0.85,
        options = {
          signcolumn = 'no', -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
        },
      },
      plugins = {
        gitsigns = { enabled = true },
        wezterm = {
          enabled = true,
          font = '+2',
        },
      },
    },
  },
  { 'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end
  },
}
