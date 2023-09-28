local cmp = require('cmp')

cmp.setup({
  completion = {
    keyword_length = 2,
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<cr>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    {
      name = 'buffer',
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      },
    },
    { name = 'path' },
    { name = 'vsnip' },
    { name = 'calc' },
  }),
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        path = "[Path]",
        vsnip = "[Snippet]",
        calc = "[Calc]",
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
