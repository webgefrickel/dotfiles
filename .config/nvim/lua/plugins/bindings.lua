local keybindings = {
  -- normal mode keybindings
  { '<C-h>', '<cmd>NavigatorLeft<cr>', desc = 'move to the lefthand split' },
  { '<C-j>', '<cmd>NavigatorDown<cr>', desc = 'move to the rigthand split' },
  { '<C-k>', '<cmd>NavigatorUp<cr>', desc = 'move to the upper split' },
  { '<C-l>', '<cmd>NavigatorRight<cr>', desc = 'move to the lower split' },
  { '¬', '>>', desc = 'bubbling lines with alt-hjkl', remap = true },
  { '˙', '<<', desc = 'bubbling lines with alt-hjkl', remap = true },
  { '˚', ':move .-2<cr>', desc = 'bubbling lines with alt-hjkl', remap = true },
  { '∆', ':move .+1<cr>', desc = 'bubbling lines with alt-hjkl', remap = true },
  { '<F5>', '<cmd>checktime<cr><cmd>redraw!<cr>', desc = 'redraw/reload with F5' },

  { '-', '<cmd>Yazi<cr>', desc = 'Open yazi file browser' },
  { ';', ':', desc = 'Colon with semicolon' },
  { 'j', 'gj', desc = 'j and k with wrapped lines' },
  { 'k', 'gk', desc = 'j and k with wrapped lines' },
  { 'n', 'nzzzv', desc = 'kepping it centered with n' },
  { 'v', '<C-V>', desc = 'remapping visual/visual-block mode' },
  { 'N', 'Nzzzv', desc = 'kepping it centered with N' },

  { 'g', group = 'code-related mappings' },
  { 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', desc = 'run code action' },
  { 'gb', '<cmd>:vertical Git blame -- %<cr>', desc = 'git blame line' },
  { 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', desc = 'show/go to definition' },
  { 'ge', '<cmd>lua vim.diagnostic.goto_next()<cr>', desc = 'go to next error in file' },
  { 'g?', '<cmd>lua vim.lsp.buf.hover()<cr>', desc = 'show hover info' },
  { 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', desc = 'show/go to type definition' },
  { 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', desc = 'show/go to declaration' },
  { 'gF', '<cmd>lua vim.lsp.buf.format()<cr>', desc = 'format file with LSP' },
  { 'gI', '<cmd>lua vim.lsp.buf.implementation()<cr>', desc = 'show/go to implementation' },
  { 'gR', '<cmd>lua vim.lsp.buf.references()<cr>', desc = 'show/go to referennces' },
  { 'gX', "<cmd>execute '/\\v^[<\\|=>]{7}/'<cr>", desc = 'find git conflicts in file' },

  { '<leader><Space>', '<cmd>e #<cr>', desc = 'alternate between last two buffers' },
  { '<leader>\\', '<C-w>v<C-w>l', desc = 'Vertical split' },
  { '<leader>-', '<C-w>s<C-w>j', desc = 'Horizontal split' },
  { '<leader>,', '<cmd>Telescope find_files<cr>', desc = 'find files' },
  { '<leader>*', '<cmd>Telescope grep_string<cr>', desc = 'find files' },
  { '<leader>.', '<cmd>Telescope buffers<cr>', desc = 'find buffers' },
  { '<leader>/', '<cmd>Telescope search_history<cr>', desc = 'find in search history' },
  { '<leader>;', '<cmd>Telescope command_history<cr>', desc = 'find in command history' },
  { '<leader>]', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'find line in current buffer' },
  { '<leader>a', '<cmd>Telescope live_grep<cr>', desc = 'live ripgrep' },
  { '<leader>b', '<cmd>Telescope git_branches<cr>', desc = 'git branches' },
  { '<leader>c', '<cmd>Telescope git_bcommits<cr>', desc = 'commits for buffer' },
  { '<leader>g', '<cmd>Telescope git_commits<cr>', desc = 'git commits' },
  { '<leader>f', '<cmd>Spectre<cr>', desc = 'open spectre for search/replace' },
  { '<leader>s', '<cmd>Telescope git_status<cr>', desc = 'git status' },
  { '<leader>t', '<cmd>Telescope treesitter<cr>', desc = 'treesitter' },
  { '<leader>w', '<cmd>set wrap! wrap?<cr>', desc = 'toggle line-wrapping' },
  { '<leader>z', '<cmd>ZenMode<cr>', desc = 'toggle zen mode' },

  { -- visual mode keybindings
    mode = { 'v' },
    { ';', ':', desc = 'Colon with semicolon' },
    { 'v', '<C-V>', desc = 'remapping visual/visual-block mode' },
    { '¬', '>gv', desc = 'bubbling lines with alt-hjkl', remap = true },
    { '˙', '<gv', desc = 'bubbling lines with alt-hjkl', remap = true },
    { '˚', ":move '<-2<cr>gv", desc = 'bubbling lines with alt-hjkl', remap = true },
    { '∆', ":move '>+1<cr>gv", desc = 'bubbling lines with alt-hjkl', remap = true },
  },
}

return {
  { 'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      local wk = require('which-key')
      wk.setup({ preset = 'modern' })
      wk.add(keybindings)
    end
  },
}
