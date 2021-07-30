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

" Keeping it centered
nnoremap N Nzzzv
nnoremap n nzzzv
nnoremap J mzJ`z

" und breakpoints when writing long text/code
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" use the arrowkeys for usefull stuff in normal mode -- switching buffers
nnoremap <up> :bfirst<cr>
nnoremap <down> :blast<cr>
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>

" Bubble/indent lines using unimpaired
" using left alt + hjkl on mac usgerman keyboard
" those are some weird mappings, but they work!
nmap ˚ :m .-2<cr>==
nmap ∆ :m .+1<cr>==
nmap ˙ <<
nmap ¬ >>
vmap ∆ :m '>+1<cr>gv=gv
vmap ˚ :m '<-2<cr>gv=gv
vmap ˙ <gv
vmap ¬ >gv

" deactivate stupid ex-mode and man-page stuff
nnoremap Q <nop>
nnoremap K <nop>
