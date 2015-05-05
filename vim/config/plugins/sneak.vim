" Vim sneak
"======================================================================

let g:sneak#use_ic_scs = 1
let g:sneak#map_netrw = 0
let g:sneak#streak = 1
nmap <Bslash> <Plug>SneakNext
nmap \| <Plug>SneakPrevious
xmap <Bslash> <Plug>VSneakNext
xmap \| <Plug>VSneakPrevious
