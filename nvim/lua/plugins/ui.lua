return {
  { 'nvim-pack/nvim-spectre', config = true,  },
  { 'kevinhwang91/nvim-bqf', config = true },
  { 'lewis6991/gitsigns.nvim', config = true },
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
      options = { theme = 'gruvbox' },
    },
  },
  { 'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end
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
