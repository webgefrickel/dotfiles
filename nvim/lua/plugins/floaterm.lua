local g = vim.g
local createCmd = vim.api.nvim_create_autocmd

g.floaterm_width = 0.9
g.floaterm_height = 0.9
g.floaterm_autoclose = 1
g.floaterm_opener = 'edit'
g.floaterm_borderchars = '─│─│╭╮╯╰'
g.floaterm_title = ''

createCmd({ 'VimEnter' }, {
  pattern = { '*' },
  command = "highlight FloatermBorder guibg='#282828' guifg='#fbf1c7'",
})
