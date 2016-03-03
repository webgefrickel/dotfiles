" vimfiler
"======================================================================

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_quick_look_command = 'qlmanage -p'
let g:vimfiler_ignore_pattern = []

call vimfiler#custom#profile('default', 'context', {
  \ 'safe' : 0
  \ })
