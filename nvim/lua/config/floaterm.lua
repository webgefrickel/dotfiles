local g = vim.g

g.floaterm_width = 0.9
g.floaterm_height = 0.9
g.floaterm_autoclose = 1
g.floaterm_opener = 'edit'
g.floaterm_borderchars = '─│─│╭╮╯╰'
g.floaterm_title = ''

vim.cmd("au VimEnter * highlight FloatermBorder guibg='#282828' guifg='#fbf1c7'")
