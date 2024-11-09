return {
  { 'hrsh7th/vim-vsnip',
    dependencies = 'rafamadriz/friendly-snippets',
    config = function ()
      vim.g.vsnip_snippet_dirs = {
        os.getenv('HOME') .. '/.local/share/nvim/lazy/friendly-snippets/snippets/',
        os.getenv('HOME') .. '/Dotfiles/snippets/',
      }

      vim.g.vsnip_filetypes = {
        scss = { 'scss', 'css' },
        javascriptreact = { 'javascript' },
        typescriptreact = { 'typescript', 'javascript' },
      }
    end
  },
  { 'hrsh7th/nvim-cmp',
    version = false,
    dependencies = {
      'Exafunction/codeium.nvim',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
    },
    config = function ()
      local cmp = require('cmp')

      cmp.setup({
        sources = cmp.config.sources({
          { name = 'codeium' },
          { name = 'nvim_lsp' },
          { name = 'buffer',
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end
            },
          },
          { name = 'path' },
          { name = 'vsnip' },
        }),

        snippet = {
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
          end
        },

        mapping = cmp.mapping.preset.insert({
          ['<cr>'] = cmp.mapping.confirm({ select = true }),
        }),

        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              codeium = '[Codeium]',
              nvim_lsp = '[LSP]',
              buffer = '[Buffer]',
              path = '[Path]',
              vsnip = '[Snippet]',
            })[entry.source.name]
            return vim_item
          end
        },
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline({}),
        sources = {
          { name = 'cmdline' }
        }
      })

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline({}),
        sources = {
          { name = 'buffer' }
        }
      })
    end
  },
}
