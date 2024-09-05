-- ensure that lazy.nvim package manager is installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
end

-- minimum starter options and settings before loading plugins/lazy
-- setting leader-key before anything else fixes bugs with lazy.nvim
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- load all plugins
require('lazy').setup({ spec = { import = 'plugins' }})

-- general sane vim options
vim.opt.breakindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.conceallevel = 2
vim.opt.cursorline = true
vim.opt.foldenable = false
vim.opt.gdefault = true
vim.opt.ignorecase = true
vim.opt.infercase = true
vim.opt.list = true
vim.opt.listchars = { extends = '»', precedes = '«', tab = '▸ ', trail = '·'}
vim.opt.relativenumber = true
vim.opt.scrolljump = 5
vim.opt.scrolloff = 3
vim.opt.shortmess:append('cs')
vim.opt.showbreak = '++++'
vim.opt.showmode = false
vim.opt.sidescroll = 10
vim.opt.sidescrolloff = 5
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = 'screen'
vim.opt.swapfile = false
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.virtualedit = 'all'

-- filetype-specific settings for text-files
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.md', '*.markdown', '*.rst', '*.txt', 'neomutt-*', '*.mail' },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { 'de', 'en' }
    vim.opt_local.wrap = true
    vim.opt_local.textwidth = 70
    vim.opt_local.formatoptions:append('q')
  end
})

-- filetype-specific settings for mails
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { 'neomutt-*', '*.mail' },
  callback = function()
    vim.opt_local.filetype = 'mail'
    vim.opt_local.comments:append('nb:>')
    vim.opt_local.formatoptions:append('aw')
  end,
})

-- better gf for everything node/js/ts
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
  callback = function()
    vim.opt_local.suffixesadd:append('.js,.jsx,.json,.ts,.tsx')
    vim.opt_local.path:append('node_modules;~')
  end,
})
