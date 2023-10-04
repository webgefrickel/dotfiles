require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'comment',
    'css',
    'gitignore',
    'glimmer',
    'html',
    'javascript',
    'json',
    'json5',
    'jsonc',
    'lua',
    'markdown',
    'norg',
    'php',
    'python',
    'regex',
    'ruby',
    'scss',
    'sql',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'vue',
    'yaml',
  },
  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
  matchup = { enable = true },
  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = 'gd',
        list_definitions = 'gl',
        list_definitions_toc = false,
        goto_next_usage = 'gn',
        goto_previous_usage = 'gp',
      },
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = 'gr',
      },
    },

  },
})

vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
