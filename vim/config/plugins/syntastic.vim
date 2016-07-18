" Syntastic
"======================================================================

" no checking for xhtml/html
let g:syntastic_sass_checkers = ['sass_lint']
let g:syntastic_scss_checkers = ['sass_lint']
let g:syntastic_css_checkers = ['sass_lint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_auto_jump = 0
let g:syntastic_mode_map = {
  \ 'mode': 'active',
  \ 'active_filetypes': ['php', 'javascript', 'json', 'scss', 'sass', 'css'],
  \ 'passive_filetypes': ['xhtml', 'html']
  \ }
