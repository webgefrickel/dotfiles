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
Bundle 'Lokaltog/vim-powerline'
Bundle 'Raimondi/delimitMate'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'
Bundle 'chrisbra/NrrwRgn'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'edsono/vim-matchit'
Bundle 'godlygeek/tabular'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'kana/vim-textobj-user'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/vitality.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tristen/vim-sparkup'


" Additional syntaxes
Bundle 'hail2u/vim-css3-syntax'
Bundle 'juvenn/mustache.vim'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'spf13/PIV'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'webgefrickel/vim-typoscript'


" Color themes
Bundle 'Lokaltog/vim-distinguished'
Bundle 'jaromero/vim-monokai-refined'
Bundle 'nanotech/jellybeans.vim'
Bundle 'zeis/vim-kolor'
Bundle 'morhetz/gruvbox'
Bundle 'altercation/vim-colors-solarized'
Bundle 'wgibbs/vim-irblack'
Bundle 'stephenmckinney/vim-solarized-powerline'


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

" add the dash to keywords -- makes better css/js search
set iskeyword+=-

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


let g:solarized_visibility = 'low'
set background=dark
colorscheme solarized

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
set foldmethod=indent
set foldnestmax=20      " max 20 levels of folding
set nofoldenable        " dont fold by default - let me do it
set foldlevelstart=1    " deactivate folding on fileload

set noerrorbells        " don't beep
set visualbell          " don't beep


" ========== Custom Keymappings ==========
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
nnoremap <leader>s :source ~/.vimrc<cr>

" Opens an edit command with the path of the currently edited file filled in
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" start a new document-wide seach-replace using abolish
nnoremap <leader>f :%S/

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
nmap <leader>U mQviwU`Q
nmap <leader>L mQviwu`Q

" Swap two words
nmap <leader>w :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" change working directory to current file
nnoremap <leader>d :cd %:p:h<CR>:pwd<CR>

" reload files when set autoread is active with F5
nnoremap <F5> :checktime<cr>


" ========== PLugins leaders and other config ==========
" search using Ag - the Silver Surfer ftw!
nnoremap <leader>a :Ag 

" Nerdtree toggle
nnoremap <leader>n :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1
let NERDTreeWinSize=50
let NERDTreeShowHidden=1

" fugitive shortcuts -- 20+ increases window-height
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
inoremap <leader>/ <Esc>:TComment<CR>i

" Tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>


" easymotion config leader m
let g:EasyMotion_leader_key = '<leader>m'

" YouCompleteMe Options
let g:ycm_complete_in_comments = 1
let g:ycm_min_num_of_chars_for_completion = 5
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']


" UltiSnips ctrl-n if ycm is active
function! g:UltiSnips_Complete()
  call UltiSnips_ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips_JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsSnippetDirectories=["snippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"


" Enable syntastic syntax checking
" no checking for xhtml/html -- because of fluidtemplate for TYPO3
" and no checking for scss.css because of CSS3 and SASS-Variable
" errors for included files - let codekit handle this
let g:syntastic_auto_jump=0
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'php', 'javascript'],
                           \ 'passive_filetypes': ['xhtml', 'html', 'scss', 'scss.css'] }    

" Buffergator
let g:buffergator_display_regime='filepath'
" no default keymappings -- needing for command-t to work
let g:buffergator_suppress_keymaps=1
let g:buffergator_viewport_split_policy='B'
let g:buffergator_split_size=12
nnoremap <leader>b :BuffergatorToggle<cr>

" CtrlP
let g:ctrlp_map = '<leader>t'
let g:ctrlp_switch_buffer = 0 " easier split screens
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 12
let g:ctrlp_custom_ignore = { 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|\.sass-cache)$',
                            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.psd$\|\.png$\|\.jpg$\|\.gif$',
                            \ }

" Gist filetype-detection
let g:gist_detect_filetype = 1

" Powerline customization
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'short'
let g:Powerline_colorscheme = 'solarized256_dark'
call Pl#Theme#RemoveSegment('scrollpercent')


" ========== Custom Pseudofunctions ==========
" JSON syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript
" Phakefiles syntax is php
au BufNewFile,BufRead Phakefile set ft=php
" SCSS is scss and css
au BufNewFile,BufRead *.scss set ft=scss.css

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif


" ========== On Save ==========
" A function for stripping Whitespace when saving
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Don't strip whitespace for files like md,txt or csv/sql - define files here
au BufWritePre *.{php,html,scss,css,js,ts,xml,json,inc,vim,rb} :call <SID>StripTrailingWhitespaces()

