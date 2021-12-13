local lspconfig = require('lspconfig')

lspconfig.cssls.setup({
  filetypes = { 'css', 'sass', 'scss' },
  settings = {
    css = {
      validate = false,
    },
    scss = {
      validate = false,
    },
    sass = {
      validate = false,
    },
  },
})
lspconfig.eslint.setup({})
lspconfig.html.setup({})
lspconfig.jsonls.setup({})
lspconfig.phpactor.setup({})
lspconfig.stylelint_lsp.setup({ 
  filetypes = { 'css', 'sass', 'scss' } 
})
lspconfig.tsserver.setup({})
lspconfig.yamlls.setup({})
