let g:mapleader=","
let g:maplocalleader=","

" Zoom / Restore window.
function! s:ToggleZoom() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction

command! ToggleZoom call s:ToggleZoom()
nnoremap <leader>z :ToggleZoom<cr>

" open new vertical split and change to split
nnoremap <leader>\ <C-w>v<C-w>l
nnoremap <leader>- <C-w>s<C-w>j

" Opens an edit command with the path of the currently edited file filled in
nnoremap <leader>o :e <C-R>=expand("%:p:h") . "/" <cr>

" Yank to clipboard with clipper -- see https://github.com/wincent/clipper
nnoremap <leader>y :call system('nc localhost 8377', @0)<cr>

" Find merge conflict markers
nnoremap <leader>gf /\v^[<\|=>]{7}( .*\|$)<cr>

" toggle wrapping
nnoremap <leader>w :set wrap! wrap?<cr>

" reload files and redraw
nnoremap <leader>r :checktime<cr>:redraw!<cr>
