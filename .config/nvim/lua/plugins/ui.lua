return {
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'nvim-telescope/telescope.nvim',
    version = false,
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
    },
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
  { 'nvim-lualine/lualine.nvim',
    opts = {
      sections = {
        lualine_b = { 'branch' },
        lualine_x = {},
        lualine_y = { 'diff', 'diagnostics' },
      },
      options = {
        theme = 'gruvbox-material',
      },
    },
  },
  { 'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    opts = {
      open_for_directories = true,
      yazi_floating_window_border = 'none',
    },
  }
}
