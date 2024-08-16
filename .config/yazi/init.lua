require('starship'):setup()
require('yatline'):setup({
  show_background = false,
  display_header_line = true, -- keep for starship plugin
  display_status_line = true,
  header_line = {},
  status_line = {
    left = {
      section_a = { { type = 'string', name = 'tab_mode' } },
      section_b = { { type = 'string', name = 'hovered_size' } },
      section_c = {
        { type = 'string', name = 'hovered_name' },
        { type = 'coloreds', name = 'count' },
      },
    },
    right = {
      section_a = { { type = 'string', name = 'cursor_position' } },
      section_b = { { type = 'string', name = 'cursor_percentage' } },
      section_c = {
        { type = 'string', name = 'hovered_file_extension', params = { true } },
        { type = 'coloreds', name = 'permissions' },
      },
    },
  },
})
