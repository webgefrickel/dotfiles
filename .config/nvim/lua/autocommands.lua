local autocmd = vim.api.nvim_create_autocmd
local o = vim.opt_local

-- filetype-specific settings for all commonly used text-files
autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.md', '*.markdown', '*.txt', 'neomutt-*', '*.mail' },
  callback = function()
    o.spell = true
    o.spelllang = { 'de', 'en' }
    o.wrap = true
    o.textwidth = 70
    o.formatoptions:append('q')
  end
})

-- additional filetype-specific settings for writing mails in neomutt
autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { 'neomutt-*', '*.mail' },
  callback = function()
    o.filetype = 'mail'
    o.comments:append('nb:>')
    o.formatoptions:append('aw')
  end,
})
