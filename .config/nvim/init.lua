-- Ensure lazy.nvim package manager is installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
end

-- Setting leader-key before anything else for lazy.nvim
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- set in mini: can be removed after lazy -> vim.pack

-- General sane options in addition to mini.basics (see lua/plugins.lua)
vim.opt.clipboard = 'unnamedplus'
vim.opt.conceallevel = 2
vim.opt.foldenable = false
vim.opt.gdefault = true
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = { extends = '»', precedes = '«', tab = '▸ ', trail = '·' }
vim.opt.number = false
vim.opt.relativenumber = true
vim.opt.scrolljump = 5
vim.opt.scrolloff = 3
vim.opt.showbreak = '+++ '
vim.opt.sidescroll = 10
vim.opt.sidescrolloff = 5
vim.opt.virtualedit = 'all'
vim.opt.swapfile = false
vim.opt.timeout = true
vim.opt.timeoutlen = 500

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

-- load all plugins and lua sub-configs
require('lazy').setup({ spec = { import = 'plugins' } })
