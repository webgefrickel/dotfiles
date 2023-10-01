vim.opt.breakindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.cmdheight = 1
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.conceallevel = 2
vim.opt.cpoptions:append('$')
vim.opt.cursorline = true
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldmethod = 'expr'
vim.opt.gdefault = true
vim.opt.grepprg = 'rg'
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.infercase = true
vim.opt.laststatus = 3
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.listchars = 'extends:»,precedes:«,tab:▸ ,trail:·'
vim.opt.foldenable = false
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.writebackup = false
vim.opt.relativenumber = true
vim.opt.scrolljump = 5
vim.opt.scrolloff = 3
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.shortmess:append('c')
vim.opt.showbreak = '\\\\\\\\'
vim.opt.showmatch = true
vim.opt.sidescroll = 10
vim.opt.sidescrolloff = 5
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.timeoutlen = 300
vim.opt.updatetime = 300
vim.opt.virtualedit = 'all'
vim.opt.visualbell = true
vim.opt.wildmode = { 'list:longest', 'list:full' }

-- colorscheme and default language
vim.g.gruvbox_baby_telescope_theme = 1
vim.cmd 'colorscheme gruvbox-baby'
vim.cmd 'language en_US.UTF-8'
