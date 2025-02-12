return {
  { 'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {
      tailwind = true,
    },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
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
}
