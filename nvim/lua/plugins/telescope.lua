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
