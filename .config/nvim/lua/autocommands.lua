-- keep treesitter parsers up to date
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function()
    require('nvim-treesitter').update()
  end
})

-- autoload treesitter-indentation for supported languages
vim.api.nvim_create_autocmd('FileType', {
  pattern = languages,
  callback = function(args)
    vim.treesitter.start(args.buf)
    vim.bo[args.buf].indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
  end
})

-- auto-resize splits
vim.api.nvim_create_autocmd('VimResized', {
  callback = function()
    vim.cmd('wincmd =')
  end
})

-- filetype-specific settings for all commonly used text-files
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.md', '*.markdown', '*.txt', 'neomutt-*', '*.mail' },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { 'de', 'en' }
    vim.opt_local.wrap = true
    vim.opt_local.textwidth = 70
    vim.opt_local.formatoptions:append('q')
  end
})

-- additional filetype-specific settings for writing mails in neomutt
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { 'neomutt-*', '*.mail' },
  callback = function()
    vim.opt_local.filetype = 'mail'
    vim.opt_local.comments:append('nb:>')
    vim.opt_local.formatoptions:append('aw')
  end,
})
