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

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
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
