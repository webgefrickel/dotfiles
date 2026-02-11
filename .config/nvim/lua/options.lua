local o = vim.opt
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- General sane options in addition to mini.basics (see lua/plugins.lua)
o.clipboard = 'unnamedplus'
o.conceallevel = 2
o.foldenable = false
o.gdefault = true
o.laststatus = 3
o.list = true
o.listchars = { extends = '»', precedes = '«', tab = '▸ ', trail = '·' }
o.number = false
o.relativenumber = true
o.scrolljump = 5
o.scrolloff = 3
o.showbreak = '+++ '
o.sidescroll = 10
o.sidescrolloff = 5
o.virtualedit = 'all'
o.swapfile = false
o.timeout = true
o.timeoutlen = 500
