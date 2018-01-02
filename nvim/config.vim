set breakindent
set cmdheight=2
set cpoptions+=$ " Add a $ to the end of a selection
set cpoptions+=J " 2 spaces after a sentence for easier text manupulation
set cursorline
set expandtab
set fileformat=unix
set fillchars=
set foldignore=
set foldlevelstart=1 " deactivate folding on fileload
set foldmethod=indent " indent folding
set foldnestmax=20 " max 20 levels of folding
set gdefault
set grepprg=ag " use ag for grepping
set hidden
set ignorecase
set infercase
set lazyredraw
set list!
set listchars=extends:»,precedes:«,tab:▸\ ,trail:·
set mouse=a
set nobackup
set noerrorbells
set nofoldenable
set noshowmode
set noswapfile
set nowrap
set nowritebackup 
set pastetoggle=<F2>
set relativenumber
set scrolljump=5
set scrolloff=3
set shiftround
set shiftwidth=2
set showbreak=\\\\\
set showmatch
set sidescroll=10
set sidescrolloff=5
set smartcase
set softtabstop=2
set tabstop=2
set virtualedit=all
set visualbell
set wildmode=list:longest,list:full
set wrapscan

filetype plugin indent on
syntax on

" deactivate syntax highlighting when diffing
if &diff
  syntax off
endif

" hybrid color scheme
let g:hybrid_reduced_contrast=0
let g:hybrid_custom_term_colors=1
set background=dark
colorscheme hybrid

