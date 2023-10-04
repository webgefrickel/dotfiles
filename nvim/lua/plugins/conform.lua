require('conform').setup({
  formatters = {
    localstylelint = {
      stdin = true,
      command = function()
        local local_repo = vim.fn.system({ 'git', 'rev-parse', '--show-toplevel' }):gsub('%s+', '')
        local local_stylelint = vim.fn.resolve(local_repo .. '/node_modules/.bin/stylelint')
        if vim.fn.filereadable(local_stylelint) then
          return local_stylelint
        end
        return 'stylelint'
      end,
      args = {
        '--fix',
        '--stdin',
        '--stdin-filename',
        vim.fn.expand('%:p'),
        '--config-basedir',
        vim.fn.system({ 'git', 'rev-parse', '--show-toplevel' }),
      },
    },
  },
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.json' },
  callback = function(args)
    require('conform').format({ formatters = { 'jq' }, quiet = true })
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.css', '*.scss' },
  callback = function(args)
    require('conform').format({ formatters = { 'localstylelint' }, quiet = true })
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
  callback = function(args)
    require('conform').format({ formatters = { 'eslint_d' }, quiet = true })
  end,
})
