-- helper function for easier mappings
local map = function(mode, lhs, rhs, opts)
  return vim.api.nvim_set_keymap(mode, lhs, rhs, vim.tbl_extend('keep', opts or {}, {
    nowait = true,
    silent = true,
    noremap = true,
  }))
end

-- remap semi-colon to be colon in normal an visual mode
map('n', ';', ':')
map('v', ';', ':')

-- deactivate ex-mode and man-pages
map('n', 'Q', '')
map('n', 'K', '')

-- keeping it centered when search/jumping to next/prev entry
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- j and k for wrapped lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- large yank in normal mode
map('n', 'Y', 'y$')

-- Swap v and CTRL-V, because Block mode is more useful
map('n', 'v', '<C-V>')
map('n', '<C-V>', 'v')
map('v', 'v', '<C-V>')
map('v', '<C-V>', 'v')

-- add undo-repo-breakpoints automatically when writing long text
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')

-- bubbling of lines/selections with alt + hjkl
map('n', '<M-k>', ':move .-2<cr>', { noremap = false })
map('n', '<M-j>', ':move .+1<cr>', { noremap = false })
map('n', '<M-h>', '<<', { noremap = false })
map('n', '<M-l>', '>>', { noremap = false })
map('v', '<M-k>', ":move '<-2<cr>gv", { noremap = false })
map('v', '<M-j>', ":move '>+1<cr>gv", { noremap = false })
map('v', '<M-h>', '<gv', { noremap = false })
map('v', '<M-l>', '>gv', { noremap = false })

-- use the arrowkeys for usefull stuff in normal mode -- switching buffers
map('n', '<up>', '<cmd>bfirst<cr>')
map('n', '<down>', '<cmd>blast<cr>')
map('n', '<left>', '<cmd>bp<cr>')
map('n', '<right>', '<cmd>bn<cr>')

-- easieser splits
map('n', '<leader>\\', '<C-w>v<C-w>l')
map('n', '<leader>-', '<C-w>s<C-w>j')

-- Telescope
map('n', '<leader>\'', '<cmd>Telescope git_files<cr>')
map('n', '<leader>,', '<cmd>Telescope find_files<cr>')
map('n', '<leader>.', '<cmd>Telescope buffers<cr>')
map('n', '<leader>/', '<cmd>Telescope search_history<cr>')
map('n', '<leader>;', '<cmd>Telescope command_history<cr>')
map('n', '<leader>a', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>b', '<cmd>Telescope git_branches<cr>')
map('n', '<leader>c', '<cmd>Telescope git_bcommits<cr>')
map('n', '<leader>]', '<cmd>Telescope current_buffer_fuzzy_find<cr>')

-- lsp and diagnostics
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
map('n', '<leader>d', '<cmd>lua vim.lsp.buf.declaration()<cr>')
map('n', '<leader>e', '<cmd>lua vim.diagnostic.goto_next()<cr>')
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<cr>')
map('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<cr>')
map('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>')
map('n', '<leader>x', '<cmd>lua vim.lsp.buf.code_action()<cr>')

-- git
map('n', '<leader>l', '<cmd>FloatermNew lazygit<cr>')
map('n', '<leader>gb', '<cmd>Gitsigns blame_line<cr>')
map('n', '<leader>gf', "<cmd>execute '/\\v^[<\\|=>]{7}/'<cr>")

-- floaterm
map('n', '-', '<cmd>FloatermNew nnn<cr>')
map('n', '<leader>t', '<cmd>FloatermNew<cr>')

-- vsnip snippets expansion
map('i', '<C-j>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"', { expr = true, noremap = false })
map('s', '<C-j>', 'vsnip#available(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-j>"', { expr = true, noremap = false })

-- other useful mappings
map('n', '<F5>', '<cmd>checktime<cr><cmd>redraw!<cr>');
map('n', '<leader>ve', '<cmd>e $MYVIMRC<cr>')
map('n', '<leader>vr', '<cmd>source $MYVIMRC<cr>')
map('n', '<leader>w', '<cmd>set wrap! wrap?<cr>')

-- Navigator.nvim
map('n', '<C-h>', '<cmd>NavigatorLeft<cr>')
map('n', '<C-j>', '<cmd>NavigatorDown<cr>')
map('n', '<C-k>', '<cmd>NavigatorUp<cr>')
map('n', '<C-l>', '<cmd>NavigatorRight<cr>')

-- FTerm.nvim
-- map('n', '-', '<cmd>lua require("FTerm").run("nnn")<cr>')
