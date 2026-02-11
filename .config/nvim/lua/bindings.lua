vim.pack.add({
  'https://github.com/folke/which-key.nvim',
})

local wk = require('which-key')
wk.setup({ preset = 'modern' })
wk.add({
  {
    mode = { 'n', 'v' },
    { ';', ':', desc = 'Colon with semicolon' },
    { 'v', '<C-V>', desc = 'remapping visual/visual-block mode' },
  },

  { '<C-h>', '<cmd>NavigatorLeft<cr>', desc = 'move to the lefthand split' },
  { '<C-j>', '<cmd>NavigatorDown<cr>', desc = 'move to the rigthand split' },
  { '<C-k>', '<cmd>NavigatorUp<cr>', desc = 'move to the upper split' },
  { '<C-l>', '<cmd>NavigatorRight<cr>', desc = 'move to the lower split' },

  { '-', '<cmd>Yazi<cr>', desc = 'Open yazi file browser' },
  { 'n', 'nzzzv', desc = 'kepping it centered with n' },
  { 'N', 'Nzzzv', desc = 'kepping it centered with N' },

  { 'g', group = 'general purpose mappings' },
  { 'g=', '<cmd>wincmd =<cr>', desc = 'resize splits' },
  { 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', desc = 'run code action' },
  { 'gb', '<cmd>:vertical Git blame -- %<cr>', desc = 'git blame split' },
  { 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', desc = 'show/go to definition' },
  { 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', desc = 'show/go to type definition' },
  { 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', desc = 'show/go to declaration' },
  { 'gF', '<cmd>lua vim.lsp.buf.format()<cr>', desc = 'format file with LSP' },
  { 'gI', '<cmd>lua vim.lsp.buf.implementation()<cr>', desc = 'show/go to implementation' },
  { 'gR', '<cmd>lua vim.lsp.buf.references()<cr>', desc = 'show/go to referennces' },
  { 'gX', "<cmd>execute '/\\v^[<\\|=>]{7}/'<cr>", desc = 'find git conflicts in file' },

  { '<leader><Space>', '<cmd>e #<cr>', desc = 'alternate between last two buffers' },
  { '<leader>/', '<C-w>v<C-w>l', desc = 'Vertical split' },
  { '<leader>-', '<C-w>s<C-w>j', desc = 'Horizontal split' },
  { '<leader>,', '<cmd>FzfLua files<cr>', desc = 'fzf find files' },
  { '<leader>.', '<cmd>FzfLua buffers<cr>', desc = 'fzf find buffers' },
  { '<leader>\\', '<cmd>FzfLua git_status<cr>', desc = 'fzf current git status files' },
  { '<leader>l', '<cmd>FzfLua lines<cr>', desc = 'fzf lines in currrent buffers' },
  { '<leader>;', '<cmd>FzfLua treesitter<cr>', desc = 'fzf symbols in current buffer' },
  { '<leader>\'', '<cmd>FzfLua git_bcommits<cr>', desc = 'fzf commits for buffer' },
  { '<leader>a', '<cmd>FzfLua live_grep_native<cr>', desc = 'fzf live ripgrep' },
  { '<leader>f', '<cmd>GrugFar<cr>', desc = 'project-wide search/replace' },
  { '<leader>w', '<cmd>set wrap! wrap?<cr>', desc = 'toggle line-wrapping' },
})
