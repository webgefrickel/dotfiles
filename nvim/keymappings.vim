" remap semi-colon to be colon in normal an visual mode
nnoremap ; :
vnoremap ; :

" Swap v and CTRL-V, because Block mode is more useful
nnoremap v <C-V>
nnoremap <C-V> v
vnoremap v <C-V>
vnoremap <C-V> v

" jk nice behaviour (screen lines vs. shown lines)
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" behave - yank just like D and C
nnoremap Y y$

" auto-yanking with clipper for selected yanking, see leader-y mapping
vnoremap y y :call system('nc localhost 8377', @0)<cr>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap N Nzz
nnoremap n nzz

" use the arrowkeys for usefull stuff in normal mode -- switching buffers
nnoremap <up> :bfirst<cr>
nnoremap <down> :blast<cr>
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>

" fix a bug in neovim/tmux-navigator
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" Bubble/indent lines using unimpaired
" using left alt + hjkl on mac usgerman keyboard
" those are some weird mappings, but they work!
nmap ˚ [e
nmap ∆ ]e
nmap ˙ <<
nmap ¬ >>
vmap ˚ [egv
vmap ∆ ]egv
vmap ˙ <gv
vmap ¬ >gv

" deactivate stupid ex-mode and man-page stuff
nnoremap Q <nop>
nnoremap K <nop>
