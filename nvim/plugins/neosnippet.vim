" Neosnippet config
"======================================================================

let g:neosnippet#disable_runtime_snippets = { "_": 1 }
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['scss'] = 'scss,css'
let g:neosnippet#scope_aliases['php'] = 'php,html'
let g:neosnippet#snippets_directory = '~/.config/nvim/dein/repos/github.com/webgefrickel/vim-snippets/snippets'

" Plugin key-mappings, expand with ctrl + j
imap <C-j> <Plug>(neosnippet_expand_or_jump)
smap <C-j> <Plug>(neosnippet_expand_or_jump)
xmap <C-j> <Plug>(neosnippet_expand_target)

