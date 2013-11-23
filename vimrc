" nocompatible mode for a real vim
set nocompatible

" switch filetype of before starting vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" load the vundle bundle of course
Bundle 'gmarik/vundle'


" plugins
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Raimondi/delimitMate'
Bundle 'SirVer/ultisnips'
Bundle 'bling/vim-airline'
Bundle 'chrisbra/NrrwRgn'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'edsono/vim-matchit'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'leshill/vim-json'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'terryma/vim-expand-region'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'


" Additional syntaxes
Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'juvenn/mustache.vim'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'webgefrickel/vim-typoscript'


" Color themes
Bundle 'altercation/vim-colors-solarized'


" and reset auto-filetype after loading all bundles
filetype plugin indent on
syntax on

set ruler          " show where you are in the document
set cursorline     " highligh current line
set ttyfast        " faster terminal usage
set showcmd        " show me what im doing. helps alot
set showmode       " show active mode
set hidden         " allows for switching buffers without writing
set relativenumber " relative line numbers are mothereffin awesome -- see how far your commands will go

set nowrap         " dont wrap lines around
set sidescroll=10  " smoother side-scrolling
set sidescrolloff=5

" nice Whitespace chars
set list!
set listchars=extends:»,precedes:«,tab:▸\ ,eol:¬,trail:·

" add the dash to keywords -- makes better css/js/html search
" dot this for specific files only (not in php/rb e.g.)
au BufNewFile,BufRead *.{json,js,css,scss,html} set iskeyword+=-
au BufNewFile,BufRead *.{json,js,css,scss,html} set iskeyword-=_

" Tabs and Whitespace
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set smarttab
set expandtab
set autoindent

" use the mouse for scrolling, yeah
set mouse=a

" gui options
if has('gui_running')
  set guifont=Menlo\ for\ Powerline:h12 " a nice font here
  set linespace=1    " menlo is nice, but very dense...
  set guioptions-=T  " no toolbar
  set guioptions-=L  " no left scrollbar
  set guioptions-=r  " no right scrollbar
endif

" mac terminal-vim play nicely with tmux
if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
  " map <Esc>[B <Down>
endif


set t_Co=256
colorscheme solarized
set background=dark
let g:solarized_termtrans = 1
let g:solarized_contrast = 'high'

set fillchars=""

" Automatically read a file that has changed on disk
set autoread

set encoding=utf-8    " Yeah. UTF-8 FTW!
set fileformat=unix

set virtualedit=all  " every mode active from v V to StrgV

" always put a status line in and make the command line 2 lines high
set laststatus=2
set ch=2

" Add a $ to the end of a selection vor easier overwriting vizualisation
set cpoptions+=$

" Searching
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set wrapscan            " set the search scan to wrap lines
set backspace=indent,eol,start " Allow backspacing over everything in insert mode

" Tab completion, and ignore some filetypes
set wildmode=list:longest,list:full
set wildignore+=.git,.svn,*.swp,*.bak,*.tmp,*.old
set wildmenu

set nobackup            " no backups
set nowritebackup
set noswapfile          " no swp-files

" Better folding
" TODO rework this and start using folds
set foldmethod=indent
setlocal foldignore=
set foldnestmax=20      " max 20 levels of folding
set nofoldenable        " dont fold by default - let me do it
set foldlevelstart=1    " deactivate folding on fileload

set noerrorbells        " don't beep
set visualbell          " don't beep


" Custom key mappings and shortcuts
" ======================================================================

" Fix some common typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" set the leader to comma , and ; == : -- faster commands
let mapleader = ","
nnoremap ; :

" jk nice behaviour (screen lines vs. shown lines)
nnoremap j gj
nnoremap k gk

" behave - yank just like D and C
nnoremap Y y$

nnoremap / /\v
vnoremap / /\v

inoremap jj <Esc>

" Switch between windows
nnoremap <tab> <C-w><C-w>
nnoremap <S-tab> <C-w>W

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap N Nzz
nnoremap n nzz

" Adjust viewports to the same size
nnoremap <leader>= <C-w>=

" reset search
nnoremap <leader><space> :noh<cr>

" open new vertical split and change to split
nnoremap <leader>\ <C-w>v<C-w>l
nnoremap <leader>- <C-w>s<C-w>j

" open a new split and edit the vimrc // easy sourcing vimrc
nnoremap <leader>v <C-w>v<C-w>l :e ~/.vimrc<cr>
nnoremap <leader>vs :source ~/.vimrc<cr>

" Opens an edit command with the path of the currently edited file filled in
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" start a new document-wide seach-replace using abolish or normal search
nnoremap <leader>f :%s/
nnoremap <leader>F :%S/

" dont use the arrow keys in insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" but use them for usefull stuff in normal mode-- switching buffers
nnoremap <up> :bfirst<cr>
nnoremap <down> :blast<cr>
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>

" Bubble lines using unimpaired
nmap <C-up> [e
nmap <C-down> ]e
vmap <C-up> [egv
vmap <C-down> ]egv

" in/outdent Keymappings
nmap <C-left> <<
nmap <C-right> >>
vmap <C-left> <gv
vmap <C-right> >gv

" pasting and copying
set pastetoggle=<F2> " toggle paste-mode for c&p with F2
set clipboard=unnamed

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>Y "*Y
" paste keeping indentation
nnoremap <leader>p p`[v`]=


" no HELP while mishitting ESC - awesome
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" deactivate stupid ex-mode and man-page stuff
nnoremap Q <nop>
nnoremap K <nop>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" Swap two words
nmap <leader>sw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" change working directory to current file
nnoremap <leader>w :cd %:p:h<CR>:pwd<CR>

" reload files when set autoread is active with F5
" TODO make this awesome reloading NERDtree + ctrl+p as well
nnoremap <F5> :checktime<cr>

" folding shortcuts
nnoremap <space> za


" when over a class in html hit fc to find that class in css/scss/js
nnoremap <leader>c :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cnext<CR>


" Plugins
" ======================================================================
"
" Ag
nnoremap <leader>a :Ag 


" NERDtree
nnoremap <leader>n :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1
let NERDTreeWinSize=50
let NERDTreeShowHidden=1


" fugitive shortcuts (20+ increases window-height)
nnoremap <silent> <leader>gs :Gstatus<CR><C-w>20+
nnoremap <silent> <leader>gd :Gdiff<CR><C-w>20+
nnoremap <silent> <leader>gc :Gcommit<CR><C-w>20+
nnoremap <silent> <leader>gb :Gblame<CR><C-w>20+
nnoremap <silent> <leader>gl :Glog<CR><C-w>20+
nnoremap <silent> <leader>gp :Git push<CR><C-w>20+
nnoremap <silent> <leader>gw :Gwrite<CR><C-w>20+


" TComment
nnoremap <leader>/ :TComment<CR>
vnoremap <leader>/ :TComment<CR>
inoremap <leader>/ <Esc>:TComment<CR>


" Tabularize (a == think align)
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a{ :Tabularize /{<CR>
vmap <Leader>a{ :Tabularize /{<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>


" easymotion
let g:EasyMotion_leader_key = '<leader>m'


" ultisnips
let g:UltiSnipsSnippetDirectories = ["snippets"]


" Syntastic
" no checking for xhtml/html -- because of fluidtemplate for TYPO3
" and no checking for scss.css because of CSS3 and SASS-Variable
let g:syntastic_auto_jump = 0
let g:syntastic_mode_map = { 
  \ 'mode': 'active',
  \ 'active_filetypes': ['ruby', 'php', 'javascript'],
  \ 'passive_filetypes': ['xhtml', 'html', 'scss', 'scss.css', 'css'] 
  \ }    


" CtrlP
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>r :CtrlPMRU<cr>
let g:ctrlp_map = '<leader>t'
let g:ctrlp_switch_buffer = 0 " easier split screens
let g:ctrlp_working_path_mode = 0 " dont try to change my working directory
let g:ctrlp_max_height = 12
let g:ctrlp_custom_ignore = { 
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|\.sass-cache)$',
  \ 'file': '\v\.(exe|so|dll|zip|gz|png|gif|jpg|tif|psd|pdf|mp4|webm|mp3)$',
  \ }


" Gist filetype-detection
let g:gist_detect_filetype = 1


" airline config
let g:airline_theme = 'solarized'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'


" Mac Dash.app integration
nmap <silent> <leader>d <Plug>DashSearch
nmap <silent> <leader>D <Plug>DashGlobalSearch
let g:dash_map = {
  \ 'javascript' : 'jquery'
  \ }



" Other functions / Onload, Autocommands
" ======================================================================

" spell correction on text-files
autocmd BufRead,BufNewFile *.{md|rst|txt} setlocal spell

" Phakefiles syntax is php
au BufNewFile,BufRead Phakefile set ft=php

" Remember last location/cursor in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

