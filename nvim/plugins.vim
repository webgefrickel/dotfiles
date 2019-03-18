" deoplete
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_smart_case=1
let g:deoplete#auto_complete_delay=150
let g:deoplete#auto_completion_start_length=4

inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
inoremap <silent> <CR> <C-r>=<SID>deoplete_cr_function()<CR>

function! s:deoplete_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

" fugitive
nnoremap <silent> <leader>gs :Gstatus<CR><C-w>20+
nnoremap <silent> <leader>gd :Gvdiff<CR><C-w>20+
nnoremap <silent> <leader>gc :Gcommit<CR><C-w>20+
nnoremap <silent> <leader>gw :Gwrite<CR><C-w>20+
nnoremap <silent> <leader>gb :Gblame<CR><C-w>20+

" neosnippet
let g:neosnippet#disable_runtime_snippets={ "_": 1 }
let g:neosnippet#scope_aliases={}
let g:neosnippet#scope_aliases['scss']='scss,css'
let g:neosnippet#scope_aliases['php']='php,html'
let g:neosnippet#snippets_directory='~/.config/nvim/dein/repos/github.com/webgefrickel/vim-snippets/snippets'

imap <C-j> <Plug>(neosnippet_expand_or_jump)
smap <C-j> <Plug>(neosnippet_expand_or_jump)
xmap <C-j> <Plug>(neosnippet_expand_target)

" ale
let g:ale_lint_on_save=1
let g:ale_lint_on_text_changed=0
let g:ale_lint_on_enter=1
let g:ale_linters = {
  \ 'css': [],
  \ 'html': ['htmlhint'],
  \ 'javascript': ['eslint'],
  \ 'scss': ['sasslint'],
\}
let g:ale_fixers = {
  \ 'css': ['prettier'],
  \ 'javascript': ['prettier'],
  \ 'json': ['prettier'],
  \ 'jsx': ['prettier'],
  \ 'markdown': ['prettier'],
  \ 'scss': ['prettier'],
  \ 'yaml': ['prettier'],
\}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 0

" fzf
nnoremap <silent> <space>, :Files<cr>
nnoremap <silent> <space>. :Buffers<cr>
nnoremap <silent> <space>l :Lines<cr>
nnoremap <silent> <space>a :Rg<cr>
nnoremap <silent> <space>h :History:<cr>

" yankstack, use alt + p, alt + P
nmap π <Plug>yankstack_substitute_older_paste
nmap ∏ <Plug>yankstack_substitute_newer_paste

" EasyMotion
let g:EasyMotion_do_mapping=0
let g:EasyMotion_smartcase=1
nmap <leader>s <Plug>(easymotion-overwin-f)
nmap <leader>S <Plug>(easymotion-overwin-f2)
