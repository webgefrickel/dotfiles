" colorscheme and optical stuff
"======================================================================

" custom list/invisible chars
set list! " nice Whitespace chars
set listchars=extends:»,precedes:«,tab:▸\ ,trail:·
set fillchars=

set laststatus=2    " statusbar is 2 high
set cmdheight=2     " command window is 2 high
set cpoptions+=$          " Add a $ to the end of a selection
set cpoptions+=J          " 2 spaces after a sentence for easier text manupulation

colorscheme solarized
let g:solarized_termtrans = 1
set background=dark " and a dark background of course
set t_Co=256        " 256 color terminal FTW

" minor optical fix vor syntastic - background for extra-error-column
highlight SignColumn ctermbg=0

" italic comments, yeah
highlight Comment cterm=italic

" bold concealed functions
highlight Conceal cterm=bold
