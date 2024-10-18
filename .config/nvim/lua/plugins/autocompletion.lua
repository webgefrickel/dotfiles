return {
  { 'Exafunction/codeium.nvim', config = true },
  { 'hrsh7th/nvim-cmp',
    version = false,
    dependencies = {
      'Exafunction/codeium.nvim',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip', -- see snippets.lua
    },
    config = function ()
      local cmp = require('cmp')

      cmp.setup({
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'codeium' },
          { name = 'buffer',
          { name = 'path' },
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end
            },
          },
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
              nvim_lsp = '[LSP]',
              codeium = '[Codeium]',
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
