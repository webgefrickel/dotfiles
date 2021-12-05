local cmd = vim.cmd

cmd([[
  augroup init
    autocmd!

    " Remember last location/cursor in file
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

    " Autoresize windows/splits when vim resizes
    autocmd VimResized * wincmd =

    " When opening temporary mails in mutt, automatically set filetype to mail
    autocmd BufNewFile,BufRead neomutt-* set ft=mail
  augroup END
]])
