local lspconfig = require('lspconfig')

lspconfig.cssls.setup({
  filetypes = { 'css', 'scss' },
  settings = {
    -- let stylelint do the validation see lint.lua
    css = { validate = false },
    scss = { validate = false },
  },
})

lspconfig.yamlls.setup({
  settings = {
    -- let stylelint do the validation see lint.lua
    yaml = { validate = false },
  },
})

lspconfig.html.setup({})
lspconfig.jsonls.setup({})
lspconfig.tsserver.setup({})
