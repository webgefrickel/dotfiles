" The Unite Plugin
"======================================================================

let g:unite_prompt='❯ '
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts =
  \ '-i --vimgrep --hidden --ignore ' .
  \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt=''
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'context.smartcase', 1)
call unite#custom#source('line,outline', 'matchers', 'matcher_fuzzy')
call unite#custom_source('file_rec, file_rec/async, file_mru, file, buffer, grep',
  \ 'ignore_pattern', join([
  \ '\.git',
  \ '\.svn',
  \ '\.sass-cache',
  \ '_srcs',
  \ 'node_modules',
  \ 'bower_components',
  \ 'vim\/bundle',
  \ '\.\(png\|gif\|jpg\|pdf\|ico\|mp4\|webm\|mp3\|woff\|ttf\|eot\|min\.js\|min\.map\|css\)$',
  \ ], '\|'))

nmap <space> [unite]
nnoremap [unite] <nop>

nnoremap <silent> [unite], :<C-u>Unite -start-insert -toggle -auto-resize file_rec/async<cr>
nnoremap <silent> [unite]b :<C-u>Unite -short-source-names -quick-match buffer<cr>
nnoremap <silent> [unite]. :<C-u>Unite -start-insert -auto-resize buffer<cr>
nnoremap <silent> [unite]l :<C-u>Unite -start-insert -auto-resize line<cr>
nnoremap <silent> [unite]y :<C-u>Unite history/yank<cr>
nnoremap <silent> [unite]f :<C-u>UniteWithCursorWord -start-insert -toggle -auto-resize file_rec/async<cr>
nnoremap <silent> [unite]a :<C-u>Unite grep:.<cr>
nnoremap <silent> [unite]A :<C-u>UniteWithCursorWord grep:.<cr>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  nmap <buffer> <C-r> <Plug>(unite_redraw)
  imap <buffer> <C-r> <Plug>(unite_redraw)
  inoremap <silent><buffer><expr> <C--> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C--> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-\> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-\> unite#do_action('vsplit')
endfunction
