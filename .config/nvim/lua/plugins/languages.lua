return {
  { 'nvim-treesitter/nvim-treesitter',
    dependencies = 'nvim-treesitter/nvim-treesitter-refactor',
    build = ':TSUpdate',
    config = function ()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all',
        sync_install = false,
        highlight = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        refactor = {
          highlight_definitions = { enable = true },
          smart_rename = { enable = true },
        },
      })
    end
  },
  { 'neovim/nvim-lspconfig',
    dependencies = {
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
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
          'vtsls',
          'yamlls',
        },
      })
    end
  },
}
