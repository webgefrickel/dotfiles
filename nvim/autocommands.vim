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
  autocmd BufNewFile,BufRead neomutt-* set ft=mail

  " special settings for json5, css and scss: better BEM
  autocmd BufNewFile,BufRead *.{json5,css,scss} set iskeyword+=-
augroup END

if &diff
  syntax off
endif
