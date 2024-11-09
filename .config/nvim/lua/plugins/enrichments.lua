return {
  { 'brenoprata10/nvim-highlight-colors',
    config = true,
    opts = {
      render = 'virtual',
      enable_tailwind = true
    }
  },
  { 'folke/zen-mode.nvim',
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        height = 0.85,
        options = {
          signcolumn = 'no',
          relativenumber = false,
        },
      },
      plugins = {
        wezterm = {
          enabled = true,
          font = '+2',
        },
      },
    },
  },
  { 'nvim-telescope/telescope.nvim',
    version = false,
    dependencies = 'nvim-telescope/telescope-fzf-native.nvim',
    config = function()
      require('telescope').setup({
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
        },
      })
      require('telescope').load_extension('fzf')
    end
  },
  { 'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    opts = {
      open_for_directories = true,
      yazi_floating_window_border = 'none',
    },
  },
}
