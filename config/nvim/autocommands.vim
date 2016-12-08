" autocommands, filetypes, spelling, keywords for specific filetypes
"======================================================================

" define a group `vimrc` and initialize.
augroup vimrc
  autocmd!

  " Remember last location/cursor in file
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

  " spell correction on text-files
  autocmd BufNewFile,BufRead *.md setlocal spell
  autocmd BufNewFile,BufRead *.md setlocal wrap

  " add the dash to keywords -- makes better css/js/html search
  " do this for specific files only (not in php/rb e.g.)
  autocmd BufNewFile,BufRead *.{js,scss,html} set iskeyword+=-
  autocmd BufNewFile,BufRead *.{js,scss,html} set iskeyword-=_
  autocmd BufNewFile,BufRead *.php set iskeyword-=-

  " scss.css snippets and stuff
  autocmd BufNewFile,BufRead *.scss set filetype=scss.css

  " Syntaxes for other files
  autocmd BufNewFile,BufRead *.twig set filetype=html.twig

  " omnicompletion for some filetypes
  autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,php,twig setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END
