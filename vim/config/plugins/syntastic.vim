" Syntastic
"======================================================================

" no checking for xhtml/html -- because of fluidtemplate for TYPO3
" and no checking for scss.css because of CSS3 and SASS-Variable
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_auto_jump = 0
let g:syntastic_mode_map = {
  \ 'mode': 'active',
  \ 'active_filetypes': ['php', 'javascript', 'json'],
  \ 'passive_filetypes': ['xhtml', 'html', 'css', 'scss', 'sass']
  \ }
