set autoindent
set autoread                     " Automatically read a file that has changed on disk
set backspace=indent,eol,start   " Allow backspacing over everything in insert mode
set breakindent
set cmdheight=2                  " command window is 2 high
set cpoptions+=$                 " Add a $ to the end of a selection
set cpoptions+=J                 " 2 spaces after a sentence for easier text manupulation
set cursorline                   " highlight current line
set display+=lastline            " shorten long lastlines
set expandtab
set fileformat=unix
set fillchars=
set foldignore=
set foldlevelstart=1             " deactivate folding on fileload
set foldmethod=indent            " indent folding
set foldnestmax=20               " max 20 levels of folding
set formatoptions+=j             " Delete comment character when joining commented lines
set gdefault                     " search & replace is always global
set grepprg=ag                   " use ag for grepping
set hidden                       " allows for switching buffers without writing
set hlsearch
set ignorecase
set laststatus=2                 " statusbar is 2 high
set lazyredraw                   " Don't redraw while executing macros
set list!                        " nice Whitespace chars
set listchars=extends:»,precedes:«,tab:▸\ ,trail:·
set mouse=a                      " mouse for scrolling
set nobackup                     " no backups
set noerrorbells                 " don't beep
set nofoldenable                 " dont fold by default - let me do it
set noshowmode                   " dont show active mode
set noswapfile                   " no swp-files
set nowrap                       " dont wrap lines around
set nowritebackup                " no stupid backup files
set pastetoggle=<F2>             " toggle paste-mode for c&p with F2
set relativenumber               " relative line numbers are mothereffin awesome -- see how far your commands will go
set ruler                        " show where you are in the document
set scrolljump=5                 " Lines to scroll when cursor leaves screen
set scrolloff=3                  " Minimum lines to keep above and below cursor
set shiftround
set shiftwidth=2
set showbreak=\\\\\
set showcmd                      " show me what im doing. helps alot
set showmatch
set sidescroll=10                " smoother side-scrolling
set sidescrolloff=5              " jump by 5 when scrolling sideways
set smartcase
set smarttab
set softtabstop=2
set tabstop=2
set timeout ttimeoutlen=100      " get rid of the delay when pressing O (for example)
set virtualedit=all              " every mode active from v V to StrgV
set visualbell                   " don't flicker
set wildmenu
set wildmode=list:longest,list:full
set wrapscan

" hybrid color scheme
let g:hybrid_reduced_contrast = 0
let g:hybrid_custom_term_colors = 1
set background=dark
colorscheme hybrid

" deactivate syntax highlighting when diffing
if &diff
  syntax off
endif
