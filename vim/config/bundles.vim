" All bundles, syntaxes and plugins
"======================================================================

NeoBundle 'Shougo/vimproc.vim', {
  \ 'build': {
  \     'mac': 'make -f make_mac.mak',
  \     'linux': 'make',
  \     'unix': 'gmake'
  \   }
  \ }

" use the bundled matchit instead of one from github
NeoBundle 'matchit.zip', {
  \ 'on_map' : ['%', 'g%']
  \ }

let bundle = neobundle#get('matchit.zip')
function! bundle.hooks.on_post_source(bundle)
  silent! execute 'doautocmd Filetype' &filetype
endfunction

" and now all bundles that don't need special treatment
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'mattn/emmet-vim/'
NeoBundle 'moll/vim-node'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'webgefrickel/vim-snippets'
NeoBundle 'wellle/tmux-complete.vim'
