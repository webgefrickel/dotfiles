require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'c',
    'comment',
    'css',
    'diff',
    'gitignore',
    'glimmer',
    'html',
    'javascript',
    'json',
    'json5',
    'jsonc',
    'lua',
    'markdown',
    'php',
    'python',
    'query',
    'regex',
    'ruby',
    'scss',
    'sql',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
    'vue',
    'yaml',
  },

  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
  pairs = { enable = true },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<leader>ss',
      node_incremental = '<leader>si',
      node_decremental = '<leader>sd',
    },
  },

  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = 'gr',
      },
    },
  },
})
