return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'yorickpeterse/nvim-tree-pairs',
      'windwp/nvim-ts-autotag',
      'Wansmer/treesj',
    },
    build = ':TSUpdate',
    version = false,
    config = function ()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash',
          'c',
          'comment',
          'css',
          'diff',
          'gitignore',
          'html',
          'javascript',
          'json',
          'lua',
          'markdown',
          'php',
          'python',
          'query',
          'regex',
          'ruby',
          'scss',
          'sql',
          'toml',
          'tsx',
          'twig',
          'typescript',
          'vim',
          'vimdoc',
          'vue',
          'yaml',
        },

        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
        pairs = { enable = true },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<leader>ss',
            node_incremental = '<leader>si',
            node_decremental = '<leader>sd',
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
          'cssls',
          'emmet_language_server',
          'eslint',
          'html',
          'jsonls',
          'lua_ls',
          'marksman',
          'phpactor',
          'stylelint_lsp',
          'ts_ls',
          'vtsls',
          'yamlls',
        },
      })

      require('mason-lspconfig').setup_handlers({
        function (server)
          local capabilities = require('cmp_nvim_lsp').default_capabilities()
          require('lspconfig')[server].setup({
            capabilities = capabilities,
          })
        end
      })
    end
  },

  { 'williamboman/mason.nvim', config = true, build = ":MasonUpdate", },
  { 'Wansmer/treesj', opts = { use_default_keymaps = false } },
  { 'yorickpeterse/nvim-tree-pairs', config = true }
}
