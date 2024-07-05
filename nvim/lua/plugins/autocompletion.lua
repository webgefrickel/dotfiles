return {
  { 'Exafunction/codeium.nvim', config = true },
  { 'CopilotC-Nvim/CopilotChat.nvim', branch = 'canary', config = true  },
  { 'zbirenbaum/copilot-cmp', config = true },
  { 'zbirenbaum/copilot.lua',
    opts = {
      -- we are using copilot-cmp for everything
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  { 'hrsh7th/nvim-cmp',
    version = false,
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip', -- see snippets.lua
      'Exafunction/codeium.nvim',
    },
    config = function ()
      local cmp = require('cmp')

      cmp.setup({
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'copilot' },
          { name = 'codeium' },
          { name = 'buffer',
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
              copilot = '[Copilot]',
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
