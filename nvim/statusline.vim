function! StatuslineGitInfo()
  let git = fugitive#head()
  if git != ''
    return " ".fugitive#head()
  else
    return ""
endfunction

function! StatusLinePaste()
  if &paste
    return "PASTE"
  else
    return ""
  endif
endfunction

function! MyStatusLine(mode)
  let statusline = ""
  if a:mode == "Enter"
    let statusline .= "%#StatusLineColor#"
  else
    let statusline .= "%#NoStatusLineColor#"
  endif
  let statusline .= "\ %f\ %m%r %{StatuslineGitInfo()}\ "
  let statusline .= "%= "
  let statusline .= "%{toupper(mode())}"
  let statusline .= "\ %{StatusLinePaste()}"
  let statusline .= "%= "
  let statusline .= "\ %y\ %{&fileencoding?&fileencoding:&encoding}\/\%{&fileformat}\ \|\ %l:%c\ "
  return statusline
endfunction

hi StatusLineColor ctermbg=white ctermfg=black
hi NoStatusLineColor ctermbg=black ctermfg=lightgrey
au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
au WinLeave * setlocal statusline=%!MyStatusLine('Leave')

set statusline=%!MyStatusLine('Enter')
