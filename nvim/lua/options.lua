local set = vim.opt
local cmd = vim.cmd
local g = vim.g

-- deactivate some unneeded language providers
g.loaded_python_provider = 0
g.loaded_perl_provider = 0

-- general options
set.breakindent = true
set.cmdheight = 2
set.completeopt= { 'menu', 'menuone', 'noselect' }
set.cpoptions:append('$')
set.cursorline = true
set.foldexpr = 'nvim_treesitter#foldexpr()'
set.foldmethod = 'expr'
set.gdefault = true
set.grepprg = 'rg'
set.hidden = true
set.ignorecase = true
set.infercase = true
set.lazyredraw = true
set.list = true
set.listchars = 'extends:»,precedes:«,tab:▸ ,trail:·'
set.foldenable = false
set.showmode = false
set.swapfile = false
set.wrap = false
set.writebackup = false
set.relativenumber = true
set.scrolljump = 5
set.scrolloff = 3
set.shiftround = true
set.shiftwidth = 2
set.shortmess:append('c')
set.showbreak = '\\\\\\\\'
set.showmatch = true
set.sidescroll = 10
set.sidescrolloff = 5
set.signcolumn = 'number'
set.smartcase = true
set.updatetime = 300
set.virtualedit = 'all'
set.visualbell = true
set.wildmode = { 'list:longest', 'list:full' }

-- colorscheme and default language
set.background = 'dark'
set.termguicolors = true
g.gruvbox_italic = 1

cmd 'colorscheme gruvbox'
cmd 'language en_US.UTF-8'
