require('lualine').setup({
  sections = {
    lualine_b = { 'branch' },
    lualine_x = {},
    lualine_y = { 'diff', 'diagnostics' },
  },
  options = {
    theme = 'gruvbox'
  },
})
