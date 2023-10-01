local lspconfig = require('lspconfig')

lspconfig.cssls.setup({
  filetypes = { 'css', 'sass', 'scss' },
  settings = {
    css = { validate = false },
    scss = { validate = false },
    sass = { validate = false },
  },
})

lspconfig.yamlls.setup({
  settings = {
    yaml = { validate = false },
  },
})

lspconfig.html.setup({})
lspconfig.jsonls.setup({})
lspconfig.tsserver.setup({})
