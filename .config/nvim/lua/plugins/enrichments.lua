return {
  { 'OXY2DEV/markview.nvim', config = true, lazy = false },
  { 'folke/todo-comments.nvim', config = true },
  { 'kevinhwang91/nvim-bqf', config = true },
  { 'lewis6991/gitsigns.nvim', config = true },
  { 'nvim-pack/nvim-spectre', config = true,  },
  { 'brenoprata10/nvim-highlight-colors', config = true, opts = {
    render = 'virtual',
    enable_tailwind = true
  }},

  { 'folke/twilight.nvim', config = true },
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
}
