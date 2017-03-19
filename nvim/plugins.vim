" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_delay = 150
let g:deoplete#auto_completion_start_length = 4

inoremap <expr><C-h> deoplete#smart_close_popup().doorboy#map_backspace()
inoremap <expr><BS> deoplete#smart_close_popup().doorboy#map_backspace()
inoremap <silent> <CR> <C-r>=<SID>deoplete_cr_function()<CR>

function! s:deoplete_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

" fugitive
nnoremap <silent> <leader>gs :Gstatus<CR><C-w>20+
nnoremap <silent> <leader>gd :Gdiff<CR><C-w>20+
nnoremap <silent> <leader>gc :Gcommit<CR><C-w>20+
nnoremap <silent> <leader>gw :Gwrite<CR><C-w>20+

" incsearch
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#consistent_n_direction = 1
let g:incsearch#magic = '\v'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" neosnippet
let g:neosnippet#disable_runtime_snippets = { "_": 1 }
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['scss'] = 'scss,css'
let g:neosnippet#scope_aliases['php'] = 'php,html'
let g:neosnippet#snippets_directory = '~/.config/nvim/dein/repos/github.com/webgefrickel/vim-snippets/snippets'

imap <C-j> <Plug>(neosnippet_expand_or_jump)
smap <C-j> <Plug>(neosnippet_expand_or_jump)
xmap <C-j> <Plug>(neosnippet_expand_target)

" sneak
let g:sneak#use_ic_scs = 0
let g:sneak#map_netrw = 1
let g:sneak#s_next = 1
let g:sneak#streak = 1

" openbrowser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" ale
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_linters = {
  \ 'css': [],
  \ 'html': ['htmlhint'],
  \ 'javascript': ['eslint'],
  \ 'sass': ['sasslint'],
  \ 'scss': ['sasslint'],
\}

" fzf
nnoremap <silent> <space>, :Files<cr>
nnoremap <silent> <space>. :Buffers<cr>
nnoremap <silent> <space>g :GFiles<cr>
nnoremap <silent> <space>c :GFiles?<cr>
nnoremap <silent> <space>l :Lines<cr>
nnoremap <silent> <space>a :Ag<cr>
nnoremap <silent> <space>r :History:<cr>

" lightline
let g:lightline = {
  \ 'colorscheme': 'hybrid',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
  \   'right': [ [ 'lineinfo' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'modified': 'LightlineModified',
  \   'readonly': 'LightlineReadonly',
  \   'fugitive': 'LightlineFugitive',
  \   'filename': 'LightlineFilename',
  \   'fileformat': 'LightlineFileformat',
  \   'filetype': 'LightlineFiletype',
  \   'fileencoding': 'LightlineFileencoding',
  \   'mode': 'LightlineMode',
  \ }
\ }

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? 'ɱ' : &modifiable ? '' : 'ɯ'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? 'ɹ' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
    \ (&ft == 'unite' ? unite#get_status_string() :
    \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
    \ (LightlineModified() != '' ? ' ' . LightlineModified() : '') .
    \ (ALEGetStatusLine() != 'OK' ? ' - ' . ALEGetStatusLine() : '')
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? 'ɓ '._ : ''
  endif
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return winwidth(0) > 70 ? lightline#mode() : ''
endfunction
