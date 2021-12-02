" remap semi-colon to be colon in normal an visual mode
nnoremap Q <nop>
nnoremap K <nop>

" deactivate stupid ex-mode and man-page stuff
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

" sane yanking and copying to clipboard/alfred-history
nnoremap Y y$
nnoremap yy yy :call system('nc localhost 8377', @0)<cr>
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

" Bubble/indent lines using unimpaired using left alt + hjkl
" on mac: weird mappings, but they work!
nmap ˚ [e
nmap ∆ ]e
nmap ˙ <<
nmap ¬ >>
vmap ˚ [egv
vmap ∆ ]egv
vmap ˙ <gv
vmap ¬ >gv
