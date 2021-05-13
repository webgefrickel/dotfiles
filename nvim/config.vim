set breakindent
set cmdheight=2
set cpoptions+=$ " Add a $ to the end of a selection
set cursorline
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set gdefault
set grepprg=rg " use ag for grepping
set hidden
set ignorecase
set infercase
set lazyredraw
set list!
set listchars=extends:»,precedes:«,tab:▸\ ,trail:·
set nofoldenable
set noshowmode
set noswapfile
set nowrap
set nowritebackup 
set relativenumber
set scrolljump=5
set scrolloff=3
set shiftround
set shiftwidth=2
set shortmess+=c
set showbreak=\\\\\
set showmatch
set sidescroll=10
set sidescrolloff=5
set smartcase
set updatetime=300
set virtualedit=all
set visualbell
set wildmode=list:longest,list:full

" language and colorscheme
set background=dark
set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox
language en_US.UTF-8
