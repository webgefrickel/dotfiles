local null_ls = require('null-ls')
local b = null_ls.builtins

-- register any number of sources simultaneously
local sources = {
  -- js and friends via eslint_d
  b.diagnostics.eslint_d,
  b.formatting.eslint_d,
  b.code_actions.eslint_d,

  -- css and scss-files
  b.diagnostics.stylelint.with({ prefer_local = 'node_modules/.bin' }),
  b.formatting.stylelint.with({ prefer_local = 'node_modules/.bin' }),

  -- markdown
  b.diagnostics.markdownlint,
  b.formatting.markdownlint,

  -- other languages
  b.diagnostics.php,
  b.diagnostics.tsc,
  b.diagnostics.yamllint,
  b.formatting.fixjson,
}

null_ls.setup({
  sources = sources,
})
