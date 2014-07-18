"======================================================================
" Neobundle Setup
"======================================================================

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'


"======================================================================
" Plugins and useful stuff/dependencies
"======================================================================

NeoBundle "Chiel92/vim-autoformat"
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak'
  \    },
  \ }
NeoBundle 'bling/vim-airline'
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'dhruvasagar/vim-vinegar'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'marijnh/tern_for_vim', {
  \ 'build' : {
  \     'mac' : 'npm install',
  \     'unix' : 'npm install'
  \    },
  \ }
NeoBundle 'mattn/emmet-vim'
NeoBundle 'moll/vim-node'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 't9md/vim-choosewin'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'webgefrickel/vim-gtfo'
NeoBundle 'webgefrickel/vim-snippets'
NeoBundle 'wellle/tmux-complete.vim'


"======================================================================
" Additional syntaxes
"======================================================================

NeoBundle 'beyondwords/vim-twig'
NeoBundle 'elzr/vim-json'
NeoBundle 'joshtronic/php.vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'othree/html5.vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'webgefrickel/vim-typoscript'


"======================================================================
" Color themes
"======================================================================

NeoBundle 'altercation/vim-colors-solarized'


"======================================================================
" Default sane config
"======================================================================

filetype plugin indent on
syntax on

set autoread                               " Automatically read a file that has changed on disk
set backspace=indent,eol,start             " Allow backspacing over everything in insert mode
set cursorline                             " highligh current line
set encoding=utf-8                         " Yeah. UTF-8 FTW!
set grepprg=ag                             " use ag for grepping
set hidden                                 " allows for switching buffers without writing
set lazyredraw                             " Don't redraw while executing macros
set list!                                  " nice Whitespace chars
set mouse=a                                " mouse for scrolling
set nobackup                               " no backups
set noerrorbells                           " don't beep
set noesckeys                              " no delay for escaping
set noshowmode                             " dont show active mode -- we use airline for that
set noswapfile                             " no swp-files
set nowrap                                 " dont wrap lines around
set nowritebackup                          " no stupid backup files
set pastetoggle=<F2>                       " toggle paste-mode for c&p with F2
set relativenumber                         " relative line numbers are mothereffin awesome -- see how far your commands will go
set ruler                                  " show where you are in the document
set scrolljump=5                           " Lines to scroll when cursor leaves screen
set scrolloff=3                            " Minimum lines to keep above and below cursor
set showcmd                                " show me what im doing. helps alot
set sidescroll=10                          " smoother side-scrolling
set sidescrolloff=5                        " jump by 5 when scrolling sideways
set timeout timeoutlen=800 ttimeoutlen=100 " get rid of the delay when pressing O (for example)
set ttyfast                                " faster terminal usage
set virtualedit=all                        " every mode active from v V to StrgV
set visualbell                             " don't flicker


"======================================================================
" Searching, completion and folds
"======================================================================

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set wrapscan

set wildmode=list:longest,list:full
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store
set wildmenu

set foldignore=
set foldmethod=indent " indent folding
set foldnestmax=20    " max 20 levels of folding
set nofoldenable      " dont fold by default - let me do it
set foldlevelstart=1  " deactivate folding on fileload


"======================================================================
" Tabs and Whitespace -- can be overridden by editorconfig
"======================================================================

set fileformat=unix
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set smarttab
set expandtab
set autoindent


"======================================================================
" gui options for macvim
"======================================================================

if has('gui_running')
  set guifont=Menlo\ for\ Powerline:h12 " a nice font here
  set linespace=1    " menlo is nice, but very dense...
  set guioptions-=T  " no toolbar
  set guioptions-=L  " no left scrollbar
  set guioptions-=r  " no right scrollbar
endif


"======================================================================
" mac terminal-vim play nicely with tmux
"======================================================================

if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
  " map <Esc>[B <Down>
endif

set clipboard=unnamed " osx + tmux fix


"======================================================================
" colorscheme and optical stuff
"======================================================================

" custom list/invisible chars
set listchars=extends:»,precedes:«,tab:▸\ ,trail:·
set fillchars=

set laststatus=2    " statusbar is 2 high
set ch=2            " command window is 2 high
set cpo+=$          " Add a $ to the end of a selection
set cpo+=J          " 2 spaces after a sentence for easier text manupulation

colorscheme solarized
set background=dark " and a dark background of course
set t_Co=256        " 256 color terminal FTW
let g:solarized_termtrans = 1
let g:solarized_contrast = 'high'
" minor optical fix vor syntastic
highlight SignColumn ctermbg=8


"======================================================================
" Custom functions
"======================================================================

" for stripping trailing whitespace
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction


"======================================================================
" autocommands, filetypes, spelling, keywords for specific filetypes
"======================================================================
"
" Remember last location/cursor in file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" spell correction on text-files
au BufRead,BufNewFile *.{md|rst} setlocal spell

" add the dash to keywords -- makes better css/js/html search
" do this for specific files only (not in php/rb e.g.)
" TODO check if this is sane at all
au BufNewFile,BufRead *.{json,js,css,scss,html} set iskeyword+=-
au BufNewFile,BufRead *.{json,js,css,scss,html} set iskeyword-=_

" scss.css snippets and stuff
au BufNewFile,BufRead *.{scss} set ft=scss.css

" Syntaxes for other files
au BufNewFile,BufRead Phakefile set ft=php
au BufNewFile,BufRead *.twig set ft=html.twig

" assume typoscript for txt -- i use md only :-)
au BufNewFile,BufRead *.{txt,ts} set ft=typoscript

" load emmet for html-files
au FileType html,php,twig,mustache EmmetInstall

" omnicompletion for some filetypes
au FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,php,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" special lib syntax sugar for javascriptj
let g:used_javascript_libs = 'jquery,underscore,backbone,angularjs'

"======================================================================
" Custom key mappings and shortcuts
"======================================================================

" remap semi-colon to be colon
nnoremap ; :
vnoremap ; :

" Swap v and CTRL-V, because Block mode is more useful
nnoremap v <C-V>
nnoremap <C-V> v
vnoremap v <C-V>
vnoremap <C-V> v

" jk nice behaviour (screen lines vs. shown lines)
nnoremap j gj
nnoremap k gk

" behave - yank just like D and C
nnoremap Y y$

" sane default search
nnoremap / /\v
vnoremap / /\v

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap N Nzz
nnoremap n nzz

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

" Bubble/indent lines using unimpaired
nmap <C-k> [e
nmap <C-j> ]e
nmap <C-h> <<
nmap <C-l> >>
vmap <C-k> [egv
vmap <C-j> ]egv
vmap <C-h> <gv
vmap <C-l> >gv

" Switch between windows
nnoremap <tab> <C-w><C-w>
nnoremap <S-tab> <C-w>W

" no help while mishitting ESC - awesome
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" deactivate stupid ex-mode and man-page stuff
nnoremap Q <nop>
nnoremap K <nop>

" reload files when set autoread is active with F5
nnoremap <F5> :checktime<CR>

" Autoformat plugin
nnoremap <F3> :Autoformat<CR>


" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null


"======================================================================
" take me to your leader!
"======================================================================

let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

" open new vertical split and change to split
nnoremap <leader>\ <C-w>v<C-w>l
nnoremap <leader>- <C-w>s<C-w>j

" Adjust viewports to the same size
nnoremap <leader>= <C-w>=

" open a new split and edit the vimrc // easy sourcing vimrc
nnoremap <leader>ve <C-w>v<C-w>l :e ~/.vimrc<cr>
nnoremap <leader>vs :source ~/.vimrc<cr>

" Opens an edit command with the path of the currently edited file filled in
nnoremap <leader>o :e <C-R>=expand("%:p:h") . "/" <CR>

" start a new document-wide seach-replace
nnoremap <leader>r :%s/

" reset search
nmap <leader><space> :noh<cr>

" short command to strip trainling whitepsace
nmap <leader>s :call <SID>StripTrailingWhitespaces()<CR>

" Find merge conflict markers
nmap <leader>g /\v^[<\|=>]{7}( .*\|$)<CR>

" Map <Leader>* to display all lines with keyword under cursor and ask which one to jump to
nmap <Leader>* [I:let nr = input("Enter line number: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>Y "*Y

" paste keeping indentation
nnoremap <leader>p p`[v`]=

" when over a class in html hit leader-f to find that class in css/scss/js
nmap <leader>f :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cnext<CR>


"======================================================================
" Plugin configuration and keymappings
"======================================================================

" vim sneak
let g:sneak#use_ic_scs = 1
let g:sneak#map_netrw = 0
let g:sneak#streak = 1
nmap <Bslash> <Plug>SneakNext
nmap \| <Plug>SneakPrevious
xmap <Bslash> <Plug>VSneakNext
xmap \| <Plug>VSneakPrevious


" fugitive
nnoremap <silent> <leader>gs :Gstatus<CR><C-w>20+
nnoremap <silent> <leader>gd :Gdiff<CR><C-w>20+
nnoremap <silent> <leader>gc :Gcommit<CR><C-w>20+
nnoremap <silent> <leader>gb :Gblame<CR><C-w>20+
nnoremap <silent> <leader>gl :Glog<CR><C-w>20+
nnoremap <silent> <leader>gp :Git push<CR><C-w>20+
nnoremap <silent> <leader>gw :Gwrite<CR><C-w>20+


" Tabularize
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t{ :Tabularize /{<CR>
vmap <Leader>t{ :Tabularize /{<CR>
nmap <Leader>t: :Tabularize /:<CR>
vmap <Leader>t: :Tabularize /:<CR>
nmap <Leader>t, :Tabularize /,<CR>
vmap <Leader>t, :Tabularize /,<CR>
nmap <Leader>t<Bar> :Tabularize /<Bar><CR>
vmap <Leader>t<Bar> :Tabularize /<Bar><CR>


" Splitjoin
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nmap <Leader>J :SplitjoinJoin<cr>
nmap <Leader>S :SplitjoinSplit<cr>

" choosewin
nmap <leader>w <Plug>(choosewin)


" TComment
nnoremap <leader>/ :TComment<CR>
vnoremap <leader>/ :TComment<CR>
inoremap <leader>/ <Esc>:TComment<CR>


" neosnippet
let g:neosnippet#disable_runtime_snippets = { "_": 1 }
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['css'] = 'css,scss'
let g:neosnippet#scope_aliases['php'] = 'php,html'
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" Syntastic
" no checking for xhtml/html -- because of fluidtemplate for TYPO3
" and no checking for scss.css because of CSS3 and SASS-Variable
let g:syntastic_auto_jump = 0
" let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': ['php', 'javascript'],
      \ 'passive_filetypes': ['xhtml', 'html', 'scss', 'css']
      \ }


" airline config
let g:airline_theme = 'solarized'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'


" EMMET deactivate emmet by default
let g:user_emmet_install_global = 0
imap <expr> <C-e> emmet#expandAbbrIntelligent("\<C-e>")


" wildfire
let g:wildfire_objects = ['i"', "i'", "i)", "i]", "i}", "iW", "it", "ip"]
let g:wildfire_fuel_map = "<ENTER>"
let g:wildfire_water_map = "<BS>"


" NERDtree
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeWinSize=50
let NERDTreeShowHidden=1
nnoremap <leader>n :NERDTreeToggle<cr>


" choosewin
let g:choosewin_overlay_enable = 1
let g:choosewin_overlay_clear_multibyte = 1
let g:choosewin_label = 'ASDFGHJKL;QWERTYUIOP'


" NEOCOMPLETE
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 4
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#enable_fuzzy_completion = 1
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
endfunction

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'


"======================================================================
" The Unite Plugin gets an extra config section
"======================================================================

let g:unite_source_history_yank_enable=1
let g:unite_prompt='❯ '
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--nocolor --nogroup -S'
let g:unite_source_grep_recursive_opt=''
let g:unite_split_rule = "botright"

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'smartcase', 1)
call unite#custom#source('line,outline', 'matchers', 'matcher_fuzzy')
call unite#custom_source('file_rec, file_rec/async, file_mru, file, buffer, grep',
      \ 'ignore_pattern', join([
      \ '\.git',
      \ '.sass-cache',
      \ '_srcs',
      \ 'node_modules',
      \ 'tmp',
      \ '\.\(png\|gif\|jpg\|pdf\|ico\|mp4\|webm\|svg\|mp3\|woff\|ttf\|eot\|min\.js\|min\.map\|css\)$',
      \ ], '\|'))

nmap <space> [unite]
nnoremap [unite] <nop>

nnoremap <silent> [unite], :<C-u>Unite -start-insert -toggle -auto-resize -buffer-name=files file_rec/async<cr><c-u>
nnoremap <silent> [unite]b :<C-u>Unite -short-source-names -quick-match buffer<cr>
nnoremap <silent> [unite]n :<C-u>Unite -toggle -auto-resize -buffer-name=files file<cr><c-u>
nnoremap <silent> [unite]. :<C-u>Unite -start-insert -auto-resize -buffer-name=buffers buffer<cr>
nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> [unite]f :<C-u>UniteWithCursorWord -start-insert -toggle -auto-resize -buffer-name=files file_rec/async<cr><c-u>
nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]A :<C-u>UniteWithCursorWord -buffer-name=search grep:.<cr>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  nmap <buffer> <C-r> <Plug>(unite_redraw)
  imap <buffer> <C-r> <Plug>(unite_redraw)
  nmap <buffer> <F5> <Plug>(unite_redraw)
  imap <buffer> <F5> <Plug>(unite_redraw)
  inoremap <silent><buffer><expr> <C--> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C--> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-\> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-\> unite#do_action('vsplit')
endfunction
