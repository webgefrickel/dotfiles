-- helper function for easier mappings
local map = function(mode, lhs, rhs, opts)
  return vim.api.nvim_set_keymap(mode, lhs, rhs, vim.tbl_extend('keep', opts or {}, {
    nowait = true,
    silent = true,
    noremap = true,
  }))
end

local wk = require('which-key')

wk.register({
  ['-'] = { '<cmd>FloatermNew nnn<cr>', 'invoke floaterm with nnn as file picker' },
  [';'] = { ':', 'Colon with semicolon' },
  ['<F5>'] = { '<cmd>checktime<cr><cmd>redraw!<cr>', 'redraw/reload with F5' },
  ['<up>'] = { '<cmd>bfirst<cr>', 'buffer navigation with arrow keys' },
  ['<right>'] = { '<cmd>bnext<cr>', 'buffer navigation with arrow keys' },
  ['<down>'] = { '<cmd>blast<cr>', 'buffer navigation with arrow keys' },
  ['<left>'] = { '<cmd>bprevious<cr>', 'buffer navigation with arrow keys' },

  g = {
    b = { '<cmd>Gitsigns blame_line<cr>', '' },
    f = { '<cmd>execute "/\\v^[<\\|=>]{7}/"<cr>', '' },
    d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'show/go to definition' },
    i = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'show/go to implementation' },
    r = { '<cmd>lua vim.lsp.buf.references()<cr>', 'show/go to referennces' },
  },

  K = { '', 'K man-pages mapping removed' },
  j = { 'gj', 'j and k with wrapped lines' },
  k = { 'gk', 'j and k with wrapped lines' },
  n = { 'nzzzv', 'kepping it centered with n' },
  v = { '<C-V>', 'remapping visual/visual-block mode' },
  s = { function() require('flash').jump() end, 'flash jump' },
  N = { 'Nzzzv', 'kepping it centered with N' },
  Q = { '', 'Q ex-mode-mapping removed' },
  S = { function() require('flash').treesitter() end, 'flash treesitter select' },
  Y = { 'y$', 'yank till end of line with Y'},

  -- all normal mode leader key mappings in one place
  ['<leader>'] = {
    [','] = { '<cmd>Telescope find_files<cr>', '' },
    ['-'] = { '<C-w>s<C-w>j', '' },
    ['.'] = { '<cmd>Telescope buffers<cr>', '' },
    ['/'] = { '<cmd>Telescope search_history<cr>', '' },
    [';'] = { '<cmd>Telescope command_history<cr>', '' },
    ['\''] = { '<cmd>Telescope git_files<cr>', '' },
    ['\\'] = { '<C-w>v<C-w>l', '' },
    [']'] = { '<cmd>Telescope current_buffer_fuzzy_find<cr>', '' },
    a = { '<cmd>Telescope live_grep<cr>', '' },
    b = { '<cmd>Telescope git_branches<cr>', '' },
    c = { '<cmd>Telescope git_bcommits<cr>', '' },
    d = { '<cmd>lua vim.lsp.buf.declaration()<cr>', '' },
    e = { '<cmd>lua vim.diagnostic.goto_next()<cr>', '' },
    f = { '<cmd>lua vim.lsp.buf.formatting()<cr>', '' },
    h = { '<cmd>lua vim.lsp.buf.hover()<cr>', '' },
    r = { '<cmd>lua vim.lsp.buf.rename()<cr>', '' },
    x = { '<cmd>lua vim.lsp.buf.code_action()<cr>', '' },
    l = { '<cmd>FloatermNew lazygit<cr>', '' },
    t = { '<cmd>FloatermNew<cr>', '' },
    v = {
      ve = { '<cmd>e $MYVIMRC<cr>', '' },
      vr = { '<cmd>source $MYVIMRC<cr>', '' },
    },
    w = { '<cmd>set wrap! wrap?<cr>', '' },
  },

  -- with <CTRL> as modifier
  ['<C-h>'] = { '<cmd>NavigatorLeft<cr>', '' },
  ['<C-j>'] = { '<cmd>NavigatorDown<cr>', '' },
  ['<C-k>'] = { '<cmd>NavigatorUp<cr>', '' },
  ['<C-l>'] = { '<cmd>NavigatorRight<cr>', '' },
  ['<C-V>'] = { 'v', '' },

  -- with <ALT/META> as modifier
  ['<M-k>'] = { ':move .-2<cr>', 'bubbling lines with alt-hjkl', noremap = false },
  ['<M-j>'] = { ':move .+1<cr>', 'bubbling lines with alt-hjkl', noremap = false },
  ['<M-h>'] = { '<<', 'bubbling lines with alt-hjkl', noremap = false },
  ['<M-l>'] = { '>>', 'bubbling lines with alt-hjkl', noremap = false },
})

-- non-normal-mode mappings
wk.register({
  [';'] = { ':', 'Colon with semicolon' },
  v = { '<C-V>', 'remapping visual/visual-block mode', },

  -- with <CTRL> as modifier
  ['<C-V>'] = { 'v', 'remapping visual/visual-block mode' },

  -- with <ALT/META> as modifier
  ['<M-k>'] = { ":move '<-2<cr>gv", 'bubbling lines with alt-hjkl', noremap = false },
  ['<M-j>'] = { ":move '>+1<cr>gv", 'bubbling lines with alt-hjkl', noremap = false },
  ['<M-h>'] = { '<gv', 'bubbling lines with alt-hjkl', noremap = false },
  ['<M-l>'] = { '>gv', 'bubbling lines with alt-hjkl', noremap = false },
}, { mode = 'v' })

wk.register({
  ['<C-j>'] = { 'vsnip#available(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-j>"', 'snippet expansion' },
}, { mode = 's', expr = true, noremap = true })

-- add undo-repo-breakpoints automatically when writing long text
-- TODO only for prose (mail md etc)
-- map('i', ',', ',<c-g>u')
-- map('i', '.', '.<c-g>u')
-- map('i', '!', '!<c-g>u')
-- map('i', '?', '?<c-g>u')
