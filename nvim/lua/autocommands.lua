local setlocal = vim.opt_local
local create = vim.api.nvim_create_autocmd

vim.cmd([[
  " Remember last location/cursor in file
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

  " Autoresize windows/splits when vim resizes
  autocmd VimResized * wincmd =
]])

-- make dash-spearated-key"ords on "word" in vim
create({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.css', '*.scss', '*.json' },
  callback = function() setlocal.iskeyword:append('-') end,
})

-- filetype-specific settings for text-files
create({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.md', '*.markdown', '*.rst', '*.txt', 'neomutt-*', '*.mail' },
  callback = function()
    setlocal.spell = true
    setlocal.spelllang = { 'de', 'en' }
    setlocal.wrap = true
    setlocal.textwidth = 70
    setlocal.formatoptions:append('q')
  end,
})

-- filetype-specific settings for mails
create({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { 'neomutt-*', '*.mail' },
  callback = function()
    setlocal.filetype = 'mail'
    setlocal.comments:append('nb:>')
    setlocal.formatoptions:append('aw')
  end,
})

