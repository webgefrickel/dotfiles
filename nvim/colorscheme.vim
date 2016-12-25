" colorscheme and optical stuff
"======================================================================

" custom list/invisible chars
set list! " nice Whitespace chars
set listchars=extends:»,precedes:«,tab:▸\ ,trail:·
set fillchars=

set laststatus=2    " statusbar is 2 high
set cmdheight=2     " command window is 2 high
set cpoptions+=$    " Add a $ to the end of a selection
set cpoptions+=J    " 2 spaces after a sentence for easier text manupulation

let g:hybrid_reduced_contrast = 0
let g:hybrid_custom_term_colors = 1
set background=dark
colorscheme hybrid
