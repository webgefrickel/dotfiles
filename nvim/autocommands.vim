" define a group `init` and initialize.
augroup init
  autocmd!

  " Remember last location/cursor in file
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

  " Autoresize windows/splits when vim resizes
  autocmd VimResized * wincmd =

  " spell correction on markdown files and mail (for mutt)
  autocmd FileType mail,markdown setlocal spell
  autocmd FileType mail,markdown setlocal wrap
  autocmd FileType mail,markdown setlocal spelllang=en,de

  " special settings for writing emails, flowed text at 72 width
  autocmd FileType mail setlocal textwidth=72
  autocmd FileType mail setlocal comments+=nb:>
  autocmd FileType mail setlocal formatoptions+=awq

  " add the dash to keywords -- makes better css/js/html search
  " do this for specific files only (not in php/rb e.g.) where dashes are
  " not used in variable names (use camelCase instead here)
  autocmd BufNewFile,BufRead *.{js,css,scss,html} set iskeyword+=-
  autocmd BufNewFile,BufRead *.{js,css,scss,html} set iskeyword-=_
  autocmd BufNewFile,BufRead *.php set iskeyword-=-

  " omnicompletion for some filetypes
  autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,php,twig setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

