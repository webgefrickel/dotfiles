return {
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'nvim-telescope/telescope.nvim',
    version = false,
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    config = function()
      require('telescope').setup({
        defaults = {
          layout_strategy = 'horizontal',
          layout_config = {
            preview_width = 0.5,
            prompt_position = 'bottom',
            width = 0.9,
            height = 0.9,
          },
          borderchars = {
            prompt = { '─', ' ', ' ', ' ', '─', '─', ' ', ' ' },
            results = { ' ' },
            preview = { ' ' },
          },
        },
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
      options = { theme = 'gruvbox-material' },
    },
  },
  { 'stevearc/oil.nvim',
     opts = {
      columns = {
        'mtime',
        'permissions',
        'size',
        'icon',
      },
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ['<esc>'] = 'actions.close',
        ['q'] = 'actions.close',
        ['<C-l>'] = false,
        ['<C-h>'] = false,
      },
     }
  },
}
