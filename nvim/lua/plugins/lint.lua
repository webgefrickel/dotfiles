require('lint').linters_by_ft = {
  markdown = { 'markdownlint' },
  php = { 'php' },
  yaml = { 'yamllint' },
  css = { 'stylelint' },
  scss = { 'stylelint' },
  json = { 'fixjson' },
  javascript = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
  typescript = { 'tsc',  'eslint_d' },
  typescriptreact = { 'tsc', 'eslint_d' },
}

-- stylelint always relative to current git-dir
local stylelint = require('lint').linters.stylelint
stylelint['stdin'] = false
stylelint['args'] = {
  '-f',
  'json',
  '--config-basedir',
  function()
    return vim.fn.system({ 'git', 'rev-parse', '--show-toplevel' })
  end,
  '--stdin-filename',
  function()
    return vim.fn.expand('%:p')
  end,
}
require('lint').linters.stylelint = stylelint

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', 'BufWritePost' }, {
  pattern = {
    '*.js', '*.ts', '*.jsx', '*.tsx',
    '*.yml', '*.yaml',
    '*.md', '*.markdown',
    '*.php',
    '*.css', '*.scss',
    '*.json',
  },
  callback = function()
    require('lint').try_lint()
  end,
})
