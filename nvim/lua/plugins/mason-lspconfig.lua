require('mason-lspconfig').setup({
  ensure_installed = {
    'cssls',
    'emmet_language_server',
    'eslint',
    'html',
    'jsonls',
    'lua_ls',
    'marksman',
    'phpactor',
    'stylelint_lsp',
    'tsserver',
    'yamlls',
  },
})

require('mason-lspconfig').setup_handlers({
  function (server)
    require('lspconfig')[server].setup({})
  end
})
