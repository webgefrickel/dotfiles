" colors
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_optInPatterns = ['full_hex', 'triple_hex', 'rgb', 'rgba', 'hsl', 'hsla']
let g:Hexokinase_ftEnabled = ['css', 'scss', 'html', 'javascript', 'php', 'json', 'json5']

" ferret multifile search
let g:FerretExecutable='rg'
let g:FerretMaxResults=1000000
let g:FerretNvim=1

" fugitive
nnoremap <silent> <leader>gs :G<CR><C-w>20+
nnoremap <silent> <leader>gd :Gvdiff<CR><C-w>20+
nnoremap <silent> <leader>gc :Gcommit<CR><C-w>20+
nnoremap <silent> <leader>gw :Gwrite<CR><C-w>20+
nnoremap <silent> <leader>gb :Gblame<CR><C-w>20+

" neosnippet
let g:neosnippet#disable_runtime_snippets={ "_": 1 }
let g:neosnippet#scope_aliases={}
let g:neosnippet#scope_aliases['scss']='scss,css'
let g:neosnippet#scope_aliases['php']='php,html'
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

imap <C-j> <Plug>(neosnippet_expand_or_jump)
smap <C-j> <Plug>(neosnippet_expand_or_jump)
xmap <C-j> <Plug>(neosnippet_expand_target)

" ale
let g:ale_fix_on_save=0
let g:ale_lint_on_enter=1
let g:ale_lint_on_insert_leave=0
let g:ale_lint_on_save=1
let g:ale_lint_on_text_changed=0
let g:ale_linters_explicit=1
let g:ale_linters = {
  \ 'css': ['stylelint'],
  \ 'html': ['htmllint'],
  \ 'javascript': ['eslint'],
  \ 'javascriptreact': ['eslint'],
  \ 'json': ['jsonlint'],
  \ 'jsx': ['eslint'],
  \ 'php': ['php'],
  \ 'scss': ['stylelint'],
  \ 'typescript': ['tslint'],
\}
let g:ale_fixers = {
  \ 'css': ['prettier'],
  \ 'javascript': ['prettier'],
  \ 'javascriptreact': ['prettier'],
  \ 'json': ['prettier'],
  \ 'jsx': ['prettier'],
  \ 'markdown': ['prettier'],
  \ 'scss': ['prettier'],
  \ 'typescript': ['prettier'],
  \ 'yaml': ['prettier'],
\}

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
