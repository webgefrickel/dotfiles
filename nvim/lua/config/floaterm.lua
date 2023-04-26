local g = vim.g

g.floaterm_width = 0.98
g.floaterm_height = 0.90
g.floaterm_position = 'bottom'
g.floaterm_autoclose = 1
g.floaterm_opener = 'edit'
g.floaterm_borderchars = '─│─│╭╮╯╰'
g.floaterm_title = ''

vim.cmd("au VimEnter * highlight FloatermBorder guibg='#282828' guifg='#fbf1c7'")
