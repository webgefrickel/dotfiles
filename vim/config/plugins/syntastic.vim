" Syntastic
"======================================================================

" no checking for xhtml/html -- because of fluidtemplate for TYPO3
" and no checking for scss.css because of CSS3 and SASS-Variable
let g:syntastic_auto_jump = 0
let g:syntastic_scss_scss_lint_exec = '/Users/webgefrickel/.rbenv/shims/scss-lint'
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': ['php', 'scss', 'javascript', 'json'],
      \ 'passive_filetypes': ['xhtml', 'html']
      \ }
