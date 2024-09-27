return {
  { 'folke/flash.nvim', config = true },
  { 'kylechui/nvim-surround', config = true },
  { 'numToStr/Navigator.nvim', config = true },
  { 'numToStr/Comment.nvim', config = true },

  { 'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      local wk = require('which-key')
      wk.setup({ preset = 'modern' })
      wk.add({
        { '<C-h>', '<cmd>NavigatorLeft<cr>', desc = 'move to the lefthand split' },
        { '<C-j>', '<cmd>NavigatorDown<cr>', desc = 'move to the rigthand split' },
        { '<C-k>', '<cmd>NavigatorUp<cr>', desc = 'move to the upper split' },
        { '<C-l>', '<cmd>NavigatorRight<cr>', desc = 'move to the lower split' },
        { '¬', '>>', desc = 'bubbling lines with alt-hjkl', remap = true },
        { '˙', '<<', desc = 'bubbling lines with alt-hjkl', remap = true },
        { '˚', ':move .-2<cr>', desc = 'bubbling lines with alt-hjkl', remap = true },
        { '∆', ':move .+1<cr>', desc = 'bubbling lines with alt-hjkl', remap = true },
        { '<F5>', '<cmd>checktime<cr><cmd>redraw!<cr>', desc = 'redraw/reload with F5' },
        { '<down>', '<cmd>blast<cr>', desc = 'buffer navigation with arrow keys' },
        { '<left>', '<cmd>bprevious<cr>', desc = 'buffer navigation with arrow keys' },
        { '<right>', '<cmd>bnext<cr>', desc = 'buffer navigation with arrow keys' },
        { '<up>', '<cmd>bfirst<cr>', desc = 'buffer navigation with arrow keys' },

        { '-', '<cmd>Yazi<cr>', desc = 'Open yazi file browser' },
        { ';', ':', desc = 'Colon with semicolon' },
        { 'j', 'gj', desc = 'j and k with wrapped lines' },
        { 'k', 'gk', desc = 'j and k with wrapped lines' },
        { 'n', 'nzzzv', desc = 'kepping it centered with n' },
        { 's', function() require('flash').jump() end, desc = 'flash jump' },
        { 'v', '<C-V>', desc = 'remapping visual/visual-block mode' },
        { 'N', 'Nzzzv', desc = 'kepping it centered with N' },
        { 'S', function() require('flash').treesitter() end, desc = 'flash treesitter select' },

        { 'g', group = 'code-related mappings' },
        { 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', desc = 'run code action' },
        { 'gb', '<cmd>Gitsigns blame_line<cr>', desc = 'git blame line' },
        { 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', desc = 'show/go to definition' },
        { 'ge', '<cmd>lua vim.diagnostic.goto_next()<cr>', desc = 'go to next error in file' },
        { 'gh', '<cmd>lua vim.lsp.buf.hover()<cr>', desc = 'show hover info' },
        { 'gs', '<cmd>Gitsigns stage_hunk<cr>', desc = 'git stage hunk' },
        { 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', desc = 'show/go to type definition' },
        { 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', desc = 'show/go to declaration' },
        { 'gF', '<cmd>lua vim.lsp.buf.format()<cr>', desc = 'format file with LSP' },
        { 'gI', '<cmd>lua vim.lsp.buf.implementation()<cr>', desc = 'show/go to implementation' },
        { 'gJ', '<cmd>TSJToggle<cr>', desc = 'split/join lines of code' },
        { 'gR', '<cmd>lua vim.lsp.buf.references()<cr>', desc = 'show/go to referennces' },
        { 'gX', "<cmd>execute '/\\v^[<\\|=>]{7}/'<cr>", desc = 'find git conflicts in file' },

        { '<leader><Space>', '<cmd>e #<cr>', desc = 'alternate between last two buffers' },
        { '<leader>\\', '<C-w>v<C-w>l', desc = 'Vertical split' },
        { '<leader>-', '<C-w>s<C-w>j', desc = 'Horizontal split' },
        { '<leader>,', '<cmd>Telescope git_files<cr>', desc = 'find files' },
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

        {
          mode = { 'v' },
          { ';', ':', desc = 'Colon with semicolon' },
          { 'v', '<C-V>', desc = 'remapping visual/visual-block mode' },
          { '¬', '>gv', desc = 'bubbling lines with alt-hjkl', remap = true },
          { '˙', '<gv', desc = 'bubbling lines with alt-hjkl', remap = true },
          { '˚', ":move '<-2<cr>gv", desc = 'bubbling lines with alt-hjkl', remap = true },
          { '∆', ":move '>+1<cr>gv", desc = 'bubbling lines with alt-hjkl', remap = true },
        },

        {
          mode = 'i',
          '<C-j>',
          "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>'",
          desc = 'snippet expansion',
          expr = true,
          remap = false,
          replace_keycodes = false,
        },

        {
          mode = 's',
          '<C-j>',
          "vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-j>'",
          desc = 'snippet expansion',
          expr = true,
          remap = false,
          replace_keycodes = false,
        },
      })
    end,
  }
}
