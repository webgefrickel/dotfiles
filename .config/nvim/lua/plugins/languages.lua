return {
  { 'nvim-treesitter/nvim-treesitter',
    dependencies = 'nvim-treesitter/nvim-treesitter-refactor',
    build = ':TSUpdate',
    config = function ()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all',
        sync_install = false,
        highlight = { enable = true },
        incremental_selection = { enable = true },
        indent = { enable = true },
        refactor = {
          highlight_definitions = { enable = true },
          smart_rename = { enable = true },
        },
      })
    end
  },
  { 'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function ()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'ast_grep',
          'bashls',
          'css_variables',
          'cssls',
          'cssmodules_ls',
          'emmet_language_server',
          'eslint',
          'html',
          'jsonls',
          'lua_ls',
          'marksman',
          'phpactor',
          'stylelint_lsp',
          'tailwindcss',
          'ts_ls',
          'vtsls',
          'yamlls',
        },
      })

      require('mason-lspconfig').setup_handlers({
        function (server)
          require('lspconfig')[server].setup({
            capabilities = require('blink.cmp').get_lsp_capabilities({
              textDocument = { completion = { completionItem = { snippetSupport = false }}},
            })
          })
        end
      })
    end
  },
}
