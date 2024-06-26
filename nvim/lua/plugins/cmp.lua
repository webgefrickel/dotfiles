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
