" gui options for macvim / gvim
"======================================================================

if has('gui_running')
  set guifont=Hack:h12 " a nice font here
  set linespace=0     " hack is nice, but very wide...
  set guioptions-=T    " no toolbar
  set guioptions-=L    " no left scrollbar
  set guioptions-=r    " no right scrollbar
endif
