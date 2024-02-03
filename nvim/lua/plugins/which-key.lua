local wk = require('which-key')

vim.opt.timeout = true
vim.opt.timeoutlen = 500

wk.register({
  ['-'] = { '<cmd>Oil<cr>', 'Open file browser in parent directory' },
  [';'] = { ':', 'Colon with semicolon' },
  ['<F5>'] = { '<cmd>checktime<cr><cmd>redraw!<cr>', 'redraw/reload with F5' },
  ['<down>'] = { '<cmd>blast<cr>', 'buffer navigation with arrow keys' },
  ['<left>'] = { '<cmd>bprevious<cr>', 'buffer navigation with arrow keys' },
  ['<right>'] = { '<cmd>bnext<cr>', 'buffer navigation with arrow keys' },
  ['<up>'] = { '<cmd>bfirst<cr>', 'buffer navigation with arrow keys' },
  ['¬'] = { '>>', 'bubbling lines with alt-hjkl', noremap = false },
  ['˙'] = { '<<', 'bubbling lines with alt-hjkl', noremap = false },
  ['˚'] = { ':move .-2<cr>', 'bubbling lines with alt-hjkl', noremap = false },
  ['∆'] = { ':move .+1<cr>', 'bubbling lines with alt-hjkl', noremap = false },

  g = {
    name = 'code-related mappings',
    -- for more code-mappings: see treesitter.lua
    D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'show/go to declaration' },
    F = { '<cmd>lua vim.lsp.buf.format()<cr>', 'format file with LSP' },
    I = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'show/go to implementation' },
    L = { '<cmd>lua vim.lsp.buf.references()<cr>', 'show/go to referennces' },
    a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'run code action' },
    b = { '<cmd>Gitsigns blame_line<cr>', 'git blame line' },
    e = { '<cmd>lua vim.diagnostic.goto_next()<cr>', 'go to next error in file' },
    h = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'show hover info' },
    s = { '<cmd>Gitsigns stage_hunk<cr>', 'git stage hunk' },
    x = { "<cmd>execute '/\\v^[<\\|=>]{7}/'<cr>", 'find git conflicts in file' },
    z = { '<cmd>ZenMode<cr>', 'toggle zen mode' },
  },

  K = { '', 'K man-pages mapping removed' },
  N = { 'Nzzzv', 'kepping it centered with N' },
  Q = { '', 'Q ex-mode-mapping removed' },
  S = { function() require('flash').treesitter() end, 'flash treesitter select' },
  j = { 'gj', 'j and k with wrapped lines' },
  k = { 'gk', 'j and k with wrapped lines' },
  n = { 'nzzzv', 'kepping it centered with n' },
  s = { function() require('flash').jump() end, 'flash jump' },
  v = { '<C-V>', 'remapping visual/visual-block mode' },

  -- with <CTRL> as modifier
  ['<C-h>'] = { '<cmd>NavigatorLeft<cr>', 'move to the lefthand split' },
  ['<C-j>'] = { '<cmd>NavigatorDown<cr>', 'move to the rigthand split' },
  ['<C-k>'] = { '<cmd>NavigatorUp<cr>', 'move to the upper split' },
  ['<C-l>'] = { '<cmd>NavigatorRight<cr>', 'move to the lower split' },
})

-- all normal mode leader key mappings in one place
wk.register({
  [','] = { '<cmd>Telescope find_files<cr>', 'find files' },
  ['-'] = { '<C-w>s<C-w>j', 'Horizontal split' },
  ['.'] = { '<cmd>Telescope buffers<cr>', 'find buffers' },
  ['/'] = { '<cmd>Telescope search_history<cr>', 'find in search history' },
  [';'] = { '<cmd>Telescope command_history<cr>', 'find in command history' },
  ['\''] = { '<cmd>Telescope git_files<cr>', 'find in git files' },
  ['\\'] = { '<C-w>v<C-w>l', 'Vertical split' },
  [']'] = { '<cmd>Telescope current_buffer_fuzzy_find<cr>', 'find line in current buffer' },

  a = { '<cmd>Telescope live_grep<cr>', 'live ripgrep' },
  b = { '<cmd>Telescope git_branches<cr>', 'git branches' },
  c = { '<cmd>Telescope git_bcommits<cr>', 'commits for buffer' },
  f = { '<cmd>Spectre<cr>', 'open spectre for search/replace' },
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
  ['¬'] = { '>gv', 'bubbling lines with alt-hjkl', noremap = false },
  ['˙'] = { '<gv', 'bubbling lines with alt-hjkl', noremap = false },
  ['˚'] = { ":move '<-2<cr>gv", 'bubbling lines with alt-hjkl', noremap = false },
  ['∆'] = { ":move '>+1<cr>gv", 'bubbling lines with alt-hjkl', noremap = false },
  v = { '<C-V>', 'remapping visual/visual-block mode' },
}, { mode = 'v' })

-- insert-substitute-mode mappings for snippets
wk.register({
  ['<C-j>'] = { 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"', 'snippet expansion' },
}, { mode = 'i', expr = true, noremap = true })
wk.register({
  ['<C-j>'] = { 'vsnip#available(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-j>"', 'snippet expansion' },
}, { mode = 's', expr = true, noremap = true })
