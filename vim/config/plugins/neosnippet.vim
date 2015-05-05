" Neosnippet config
"======================================================================

let g:neosnippet#disable_runtime_snippets = { "_": 1 }
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['scss'] = 'scss,css'
let g:neosnippet#scope_aliases['php'] = 'php,html'
let g:neosnippet#snippets_directory = '~/.vim/bundle/vim-snippets/snippets'

" Neosnippet - SuperTab like snippets behavior.
smap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
