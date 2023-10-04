require('lint').linters_by_ft = {
  markdown = { 'markdownlint' },
  php = { 'php' },
  yaml = { 'yamllint' },
  css = { 'stylelint' },
  scss = { 'stylelint' },
  json = { 'jsonlint' },
  javascript = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
  typescript = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
}

-- stylelint always relative to current git-dir
local stylelint = require('lint').linters.stylelint
stylelint['args'] = {
  '--formatter',
  'json',
  "--stdin",
  "--stdin-filename",
  vim.fn.expand("%:p"),
  '--config-basedir',
  vim.fn.system({ 'git', 'rev-parse', '--show-toplevel' }),
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
