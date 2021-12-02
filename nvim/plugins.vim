lua << EOF
require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

require('lualine').setup({
  options = {
    theme = 'gruvbox',
  },
})

require('lspconfig').stylelint_lsp.setup({
  settings = {
    stylelintplus = {
      -- TODO why this not working?!
      autoFixOnFormat = true,
      autoFixOnSave = true,
      validateOnSave = true,
    },
  },
})

require('lspconfig').cssls.setup({
  filetypes = { 'css', 'scss' },
  settings = {
    css = {
      validate = false,
    },
    scss = {
      validate = false,
    },
  },
})
EOF

nnoremap <silent> <leader>, :BufferLinePick<cr>
nnoremap <silent> <leader>] :BufferLineCycleNext<CR>
nnoremap <silent> <leader>[ :BufferLineCyclePrev<CR>

" fugitive
nnoremap <silent> <leader>gs :G<cr><C-w>20+
nnoremap <silent> <leader>gd :Gvdiff<cr><C-w>20+
nnoremap <silent> <leader>gc :Gcommit<cr><C-w>20+
nnoremap <silent> <leader>gw :Gwrite<cr><C-w>20+
nnoremap <silent> <leader>gb :Gblame<cr><C-w>20+

" fzf
nnoremap <silent> <space>, :Files<cr>
nnoremap <silent> <space>. :Buffers<cr>
nnoremap <silent> <space>l :Lines<cr>
nnoremap <silent> <space>a :Rg<cr>
nnoremap <silent> <space>h :History:<cr>
nnoremap <silent> <space>/ :History/<cr>
nnoremap <silent> <space>c :Commits<cr>

" EasyMotion
let g:EasyMotion_do_mapping=0
let g:EasyMotion_smartcase=1
nmap <leader>j <Plug>(easymotion-overwin-f2)

" Floaterm
let g:floaterm_keymap_toggle = '<space>t'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.62
let g:floaterm_autoclose = 1
let g:floaterm_opener = 'edit'
let g:floaterm_borderchars = '─│─│╭╮╯╰'
let g:floaterm_title = ''
hi FloatermBorder guibg='#282828' guifg='#a89984'
nnoremap <silent> - :FloatermNew nnn<cr>
nnoremap <silent> <space>g :FloatermNew lazygit<cr>

" COC.vim
inoremap <silent><expr> <C-j>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<cr>" :
  \ <SID>check_back_space() ? "\<C-j>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<c-j>'

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <cr>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<cr>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Leader mappings
nmap <leader>c <Plug>(coc-rename)
nmap <leader>e <Plug>(coc-diagnostic-next)
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Selection ranges
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Map function and class text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" coc-yank, replaces yankstack, use alt + p
nnoremap π :<C-u>CocList -A --normal yank<cr>

" coc multiple cursors (very helpful for when in CocSearch)
hi CocCursorRange ctermbg=139 ctermfg=234
nmap <silent> <c-n> <Plug>(coc-cursors-word)*
xmap <silent> <c-n> y/\V<C-r>=escape(@",'/\')<cr><cr>gN<Plug>(coc-cursors-range)gn
