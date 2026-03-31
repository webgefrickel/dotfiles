vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
