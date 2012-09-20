" Load pathogen, switch on filetype and syntax afterwards
call pathogen#infect()
filetype plugin indent on
syntax on

" set zsh as default to keep aliases and stuff in :! commands
" this breaks mvimdiff! thus i better uncomment it
" Gstatus etc. will work fine after 'sudo mv /etc/zshenv /etc/zprofile' anyways
" set shell=/usr/local/bin/zsh\ -l\ -i\ -e

set nocompatible   " activate vim awesomeness
set ruler          " show where you are in the document
set cursorline     " highligh current line
set ttyfast        " faster terminal usage
set ttyscroll=3    " faster terminal scrolling
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

" Syntax coloring lines that are too long just slows down the world "
" set synmaxcol=256  
set lazyredraw     " to avoid scrolling problems

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
  set guifont=MesloLGMDZ:h12 " a nice font here
  set guioptions-=T          " no toolbar
  set guioptions-=L          " no left scrollbar
  set guioptions-=r          " no right scrollbar
endif

" color options
color jellybeans
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

nnoremap / /\v
vnoremap / /\v

" Switch between windows
nnoremap <tab> <C-w><C-w>
nnoremap <S-tab> <C-w>W

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap N Nzz
nnoremap n nzz

" Adjust viewports to the same size
nnoremap <leader>= <C-w>=
inoremap <leader>= <Esc> <C-w>=

" reset search
nnoremap <leader><space> :noh<cr>

" open new vertical split and change to split
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

" Opens an edit command with the path of the currently edited file filled in
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" start a new document-wide seach-replace
nnoremap <leader>f :%s/\v

" dont use the arrow keys. LEARN VIM
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nmap <leader>p <C-^>

" but use them for usefull stuff -- switching buffers
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
imap <C-left> <Esc><<i
imap <C-right> <Esc>>>i
vmap <C-left> <gv
vmap <C-right> >gv

set pastetoggle=<F2>    " toggle paste-mode for c&p with F2

" no HELP while mishitting ESC - awesome
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" stupid ex-mode and man-page stuff
nnoremap Q <nop>
nnoremap K <nop>

" upper/lower word
nmap <leader>U mQviwU`Q
nmap <leader>L mQviwu`Q
" upper/lower first CHAR of word
nmap <leader>u mQgewvU`Q
nmap <leader>l mQgewvu`Q

" Swap two words
nmap <leader>w :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" change working directory to current file
nnoremap <leader>d :cd %:p:h<CR>:pwd<CR>

" ========== PLugins leaders and other config ==========
" search using ack
nnoremap <leader>a :Ack 

" Nerdtree toggle
nnoremap <leader>n :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1
let NERDTreeWinSize=50
let NERDTreeShowHidden=1

" fugitive shortcuts -- 20+ increases window-height
nmap <leader>gs :Gstatus<CR><C-w>20+
nmap <leader>gg :Gcommit<CR><C-w>20+

" ZoomWin configuration
nnoremap <leader>z :ZoomWin<CR>

" TComment
nnoremap <leader>/ :TComment<CR>
vnoremap <leader>/ :TComment<CR>
inoremap <leader>/ <Esc>:TComment<CR>i

" refresh browser mapping
nnoremap <silent><leader>r :wall<CR> :RRB<CR>
" Browser-Refresh config -- only use chrome
let g:RefreshRunningBrowserDefault = 'chrome'

" easymotion config leader m
let g:EasyMotion_leader_key = '<leader>m'

" Enable syntastic syntax checking
" no checking for xhtml/html -- because of fluidtemplate for TYPO3
" and no checking for scss.css because of CSS3 and SASS-Variable
" errors for included files - let codekit handle this
let g:syntastic_auto_jump=0
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'php', 'javascript'],
                           \ 'passive_filetypes': ['xhtml', 'html', 'scss', 'scss.css'] }    

" Yankring
nnoremap <leader>y :YRShow<CR>
inoremap <leader>y :YRShow<CR>
let g:yankring_history_dir = '$HOME'
let g:yankring_window_height = 12
let g:yankring_min_element_length = 2
let g:yankring_history_file = '.yankring'

" Buffergator
let g:buffergator_display_regime='filepath'
" no default keymappings -- needing for command-t to work
let g:buffergator_suppress_keymaps=1
let g:buffergator_viewport_split_policy='B'
let g:buffergator_split_size=12
nnoremap <leader>b :BuffergatorToggle<cr>

" Tagbar config and keyboard toggler
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
let g:tagbar_compact=1

" CtrlP
let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 12
let g:ctrlp_custom_ignore = { 'dir':  '\v[\/](\.git|\.hg|\.svn|\.sass-cache)$',
                            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.psd$\|\.png$\|\.jpg$\|\.gif$',
                            \ }
" easier split screens
let g:ctrlp_switch_buffer = 0

" Gist filetype-detection
let g:gist_detect_filetype = 1

" Powerline customization
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'short'
call Pl#Theme#RemoveSegment('scrollpercent')

" custom shift-tab mapping -- opens new { } and blank line
" Supertab and snipmate backwards-key are overwritten to use shfit + alt / crtl
let g:SuperTabMappingBackward = '<s-c-tab>'
let g:snips_trigger_key_backwards = '<s-m-tab>'
inoremap <s-tab> {<Esc>i <Esc>o<CR>}<Esc>ki<tab>


" ========== Custom Pseudofunctions ==========
" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript
" typoscript syntax
au BufNewFile,BufRead *.ts set ft=typoscript
" typoscript syntax for all text-files
au BufNewFile,BufRead *.txt set ft=typoscript
" scss
au BufNewFile,BufRead *.scss set ft=scss.css
" php
au BufNewFile,BufRead Phakefile set ft=php

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
