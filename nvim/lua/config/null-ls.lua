local null_ls = require('null-ls')
local b = null_ls.builtins

-- register any number of sources simultaneously
local sources = {
  -- js and friends via eslint_d
  b.formatting.eslint_d,
  b.formatting.stylelint.with({ prefer_local = 'node_modules/.bin' }),
  b.formatting.markdownlint,
  b.code_actions.eslint_d,
}

null_ls.setup({
  sources = sources,
})
