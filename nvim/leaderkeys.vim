let g:mapleader=","
let g:maplocalleader=","

" open new vertical split and change to split
nnoremap <leader>\ <C-w>v<C-w>l
nnoremap <leader>- <C-w>s<C-w>j

" open a new split and edit the vimrc // easy sourcing vimrc
nnoremap <leader>ve <C-w>v<C-w>l :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>

" Opens an edit command with the path of the currently edited file filled in
nnoremap <leader>o :e <C-R>=expand("%:p:h") . "/" <CR>

" Yank to clipboard with clipper -- see https://github.com/wincent/clipper
nnoremap <leader>y :call system('nc localhost 8377', @0)<CR>

" Find merge conflict markers
nnoremap <leader>gf /\v^[<\|=>]{7}( .*\|$)<CR>

" paste keeping indentation
nnoremap <leader>p p`[v`]=

" toggle wrapping
nnoremap <leader>w :set wrap! wrap?<CR>

" reload files when set autoread is active with F5
nnoremap <leader>r :checktime<CR>
