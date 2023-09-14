require('telescope').setup({
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.5,
      prompt_position = 'bottom',
      width = 0.9,
      height = 0.9,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
    },
  },
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
