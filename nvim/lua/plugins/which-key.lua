local wk = require('which-key')

vim.opt.timeout = true
vim.opt.timeoutlen = 500

wk.register({
  ['-'] = { '<cmd>FloatermNew nnn<cr>', 'invoke floaterm with nnn as file picker' },
  [';'] = { ':', 'Colon with semicolon' },
  ['<F5>'] = { '<cmd>checktime<cr><cmd>redraw!<cr>', 'redraw/reload with F5' },
  ['<up>'] = { '<cmd>bfirst<cr>', 'buffer navigation with arrow keys' },
  ['<right>'] = { '<cmd>bnext<cr>', 'buffer navigation with arrow keys' },
  ['<down>'] = { '<cmd>blast<cr>', 'buffer navigation with arrow keys' },
  ['<left>'] = { '<cmd>bprevious<cr>', 'buffer navigation with arrow keys' },
  ['˙'] = { '<<', 'bubbling lines with alt-hjkl', noremap = false },
  ['∆'] = { ':move .+1<cr>', 'bubbling lines with alt-hjkl', noremap = false },
  ['˚'] = { ':move .-2<cr>', 'bubbling lines with alt-hjkl', noremap = false },
  ['¬'] = { '>>', 'bubbling lines with alt-hjkl', noremap = false },

  g = {
    name = 'code-related mappings',
    a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'run code action' },
    b = { '<cmd>Gitsigns blame_line<cr>', 'git blame line' },
    d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'show/go to definition' },
    e = { '<cmd>lua vim.diagnostic.goto_next()<cr>', 'go to next error in file' },
    f = { '<cmd>lua vim.lsp.buf.formatting()<cr>', 'format file with LSP' },
    h = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'show hover info' },
    r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'lsp rename' },
    x = { '<cmd>execute "/\\v^[<\\|=>]{7}/"<cr>', 'find git conflicts in file' },

    D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'show/go to declaration' },
    I = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'show/go to implementation' },
    R = { '<cmd>lua vim.lsp.buf.references()<cr>', 'show/go to referennces' },
  },

  j = { 'gj', 'j and k with wrapped lines' },
  k = { 'gk', 'j and k with wrapped lines' },
  n = { 'nzzzv', 'kepping it centered with n' },
  s = { function() require('flash').jump() end, 'flash jump' },
  v = { '<C-V>', 'remapping visual/visual-block mode' },

  K = { '', 'K man-pages mapping removed' },
  N = { 'Nzzzv', 'kepping it centered with N' },
  Q = { '', 'Q ex-mode-mapping removed' },
  S = { function() require('flash').treesitter() end, 'flash treesitter select' },
  Y = { 'y$', 'yank till end of line with Y' },

  -- with <CTRL> as modifier
  ['<C-h>'] = { '<cmd>NavigatorLeft<cr>', 'move to the lefthand split' },
  ['<C-j>'] = { '<cmd>NavigatorDown<cr>', 'move to the rigthand split' },
  ['<C-k>'] = { '<cmd>NavigatorUp<cr>', 'move to the upper split' },
  ['<C-l>'] = { '<cmd>NavigatorRight<cr>', 'move to the lower split' },
  ['<C-V>'] = { 'v', 'remapping visual/visual-block mode' },
})

-- all normal mode leader key mappings in one place
wk.register({
  ['\\'] = { '<C-w>v<C-w>l', 'Vertical split' },
  ['-'] = { '<C-w>s<C-w>j', 'Horizontal split' },
  [','] = { '<cmd>Telescope find_files<cr>', 'find files' },
  ['.'] = { '<cmd>Telescope buffers<cr>', 'find buffers' },
  ['\''] = { '<cmd>Telescope git_files<cr>', 'find in git files' },
  [';'] = { '<cmd>Telescope command_history<cr>', 'find in command history' },
  ['/'] = { '<cmd>Telescope search_history<cr>', 'find in search history' },
  [']'] = { '<cmd>Telescope current_buffer_fuzzy_find<cr>', 'find line in current buffer' },

  a = { '<cmd>Telescope live_grep<cr>', 'live ripgrep' },
  b = { '<cmd>Telescope git_branches<cr>', 'git branches' },
  c = { '<cmd>Telescope git_bcommits<cr>', 'commits for buffer' },
  l = { '<cmd>FloatermNew lazygit<cr>', 'open lazygit' },
  t = { '<cmd>FloatermNew<cr>', 'open new terminal' },
  v = {
    name = 'vim related',
    e = { '<cmd>e $MYVIMRC<cr>', 'edit vimrc' },
    r = { '<cmd>source $MYVIMRC<cr>', 'source vimrc' },
  },
  w = { '<cmd>set wrap! wrap?<cr>', 'toggle line-wrapping' },
}, { prefix = '<leader>' })

-- visual-mode mappings
wk.register({
  [';'] = { ':', 'Colon with semicolon' },
  ['˙'] = { '<gv', 'bubbling lines with alt-hjkl', noremap = false },
  ['∆'] = { ":move '>+1<cr>gv", 'bubbling lines with alt-hjkl', noremap = false },
  ['˚'] = { ":move '<-2<cr>gv", 'bubbling lines with alt-hjkl', noremap = false },
  ['¬'] = { '>gv', 'bubbling lines with alt-hjkl', noremap = false },

  v = { '<C-V>', 'remapping visual/visual-block mode' },
  ['<C-V>'] = { 'v', 'remapping visual/visual-block mode' },
}, { mode = 'v' })

-- non-normal-mode mappings
wk.register({
  ['<C-j>'] = { 'vsnip#available(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-j>"', 'snippet expansion' },
}, {
  mode = 's',
  expr = true,
  noremap = true
})
