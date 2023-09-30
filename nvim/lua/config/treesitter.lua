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
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      include_surrounding_whitespace = true,
    },
  }
})
