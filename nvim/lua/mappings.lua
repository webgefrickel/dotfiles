-- set the leader key to space
vim.api.nvim_set_keymap('n', '<space>', '', {})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

-- Keeping it centered when searching and jumping to next entry
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- j and k for wrapped lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- sane yanking and copying to clipboard/alfred-history
map('n', 'Y', 'y$')
map('n', 'yy', 'yy <cmd>call system("nc localhost 8377", @0)<cr>')
map('v', 'y', 'y <cmd>call system("nc localhost 8377", @0)<cr>')
map('v', 'Y', 'y <cmd>call system("nc localhost 8377", @0)<cr>')

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
map('n', '˚', ':move .-2<cr>', { noremap = false })
map('n', '∆', ':move .+1<cr>', { noremap = false })
map('n', '˙', '<<', { noremap = false })
map('n', '¬', '>>', { noremap = false })
map('v', '˚', ":move '<-2<cr>gv", { noremap = false })
map('v', '∆', ":move '>+1<cr>gv", { noremap = false })
map('v', '˙', '<gv', { noremap = false })
map('v', '¬', '>gv', { noremap = false })

-- use the arrowkeys for usefull stuff in normal mode -- switching buffers
map('n', '<up>', '<cmd>bfirst<cr>')
map('n', '<down>', '<cmd>blast<cr>')
map('n', '<left>', '<cmd>bp<cr>')
map('n', '<right>', '<cmd>bn<cr>')

-- easieser splits
map('n', '<leader>\\', '<C-w>v<C-w>l')
map('n', '<leader>-', '<C-w>s<C-w>j')

-- fzf-lua
map('n', '<leader>,', '<cmd>lua require("fzf-lua").files()<cr>')
map('n', '<leader>.', '<cmd>lua require("fzf-lua").buffers()<cr>')
map('n', '<leader>/', '<cmd>lua require("fzf-lua").search_history()<cr>')
map('n', '<leader>;', '<cmd>lua require("fzf-lua").command_history()<cr>')
map('n', '<leader>`', '<cmd>lua require("fzf-lua").files({ cwd = "~/" })<cr>')
map('n', '<leader>a', '<cmd>lua require("fzf-lua").live_grep()<cr>')
map('n', '<leader>b', '<cmd>lua require("fzf-lua").git_branches()<cr>')
map('n', '<leader>c', '<cmd>lua require("fzf-lua").git_bcommits()<cr>')
map('n', '<leader>]', '<cmd>lua require("fzf-lua").lines()<cr>')

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
map('n', '<leader>gd', '<cmd>DiffviewOpen<cr>')
map('n', '<leader>gc', '<cmd>DiffviewClose<cr>')
map('n', '<leader>gh', '<cmd>DiffviewFileHistory<cr>')
map('n', '<leader>gb', '<cmd>GitBlameToggle<cr>')
-- TODO rework this?!
map('n', '<leader>gf', '/\\v^[<\\|=>]{7}( .*\\|$)<cr>')

-- floaterm
map('n', '-', '<cmd>FloatermNew nnn<cr>')
map('n', '<leader>t', '<cmd>FloatermNew<cr>')

-- vsnip snippets expansion
map('i', '<C-j>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"', { expr = true, noremap = false })
map('s', '<C-j>', 'vsnip#available(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-j>"', { expr = true, noremap = false
})

-- other useful mappings
map('n', '<F5>', '<cmd>checktime<cr><cmd>redraw!<cr>');
map('n', '<leader>j', '<cmd>lua require("hop").hint_words()<cr>')
map('n', '<leader>ve', '<cmd>e $MYVIMRC<cr>')
map('n', '<leader>vr', '<cmd>source $MYVIMRC<cr>')
map('n', '<leader>w', '<cmd>set wrap! wrap?<cr>')
