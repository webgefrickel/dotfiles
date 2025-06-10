require('starship'):setup()
require('full-border'):setup()
require('zoxide'):setup({ update_db = true })
require('yatline'):setup({
  show_background = false,
  display_status_line = true,
  display_header_line = true, -- keep for starship plugin
  header_line = {}, -- keep for starship plugin
  status_line = {
    left = {
      section_a = {
        { type = 'string', name = 'tab_mode' },
        { type = 'line', name = 'tabs', params = { 'left' } },
      },
      section_b = {},
      section_c = {
        { type = 'string', name = 'hovered_name' },
        { type = 'coloreds', name = 'count' },
      },
    },
    right = {
      section_a = { { type = 'string', name = 'cursor_position' } },
      section_b = {},
      section_c = {
        { type = 'coloreds', name = 'permissions' },
        { type = 'string', name = 'hovered_size' },
      },
    },
  },
})
