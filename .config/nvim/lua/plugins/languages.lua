return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = 'nvim-treesitter/nvim-treesitter-refactor',
    build = ':TSUpdate',
    version = false,
    config = function ()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all',
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
        textobjects = {
          select = {
            enable = false,
          },
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'gS',
            node_incremental = 'gSS',
            node_decremental = 'gSD',
          },
        },
        refactor = {
          highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
          },
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = 'gr',
            },
          },
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
      require('mason-lspconfig').setup({
        ensure_installed = {
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
          local capabilities = require('blink.cmp').get_lsp_capabilities({
            textDocument = { completion = { completionItem = { snippetSupport = false } } },
          })
          require('lspconfig')[server].setup({
            capabilities = capabilities,
          })
        end
      })
    end
  },
  { 'williamboman/mason.nvim', config = true, build = ':MasonUpdate', },
}
