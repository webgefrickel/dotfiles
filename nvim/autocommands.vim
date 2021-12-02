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
  autocmd FileType mail,markdown setlocal textwidth=70
  autocmd FileType mail,markdown setlocal formatoptions+=q

  " correctly indent comments/quoted text in mails
  autocmd FileType mail setlocal comments+=nb:>
  autocmd FileType mail setlocal formatoptions+=aw
  autocmd BufNewFile,BufRead neomutt-* set ft=mail

  " special settings for json5, css and scss: better BEM
  autocmd BufNewFile,BufRead *.{json5,css,scss} set iskeyword+=-
  autocmd BufNewFile,BufRead *.scss set ft=sass.css
augroup END
