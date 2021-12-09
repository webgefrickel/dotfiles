local lspconfig = require('lspconfig')
local cmd = vim.cmd
local g = vim.g

lspconfig.cssls.setup({
  filetypes = { 'css', 'sass', 'scss' },
  settings = {
    css = {
      validate = false,
    },
    scss = {
      validate = false,
    },
    sass = {
      validate = false,
    },
  },
})
lspconfig.eslint.setup({})
lspconfig.html.setup({})
lspconfig.jsonls.setup({})
lspconfig.phpactor.setup({})
lspconfig.stylelint_lsp.setup({ 
  filetypes = { 'css', 'sass', 'scss' } 
})
lspconfig.tsserver.setup({})
lspconfig.yamlls.setup({})

-- treesitter
require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

require('lualine').setup({
  options = {
    theme = 'gruvbox',
  },
})

require('hop').setup({})

require('nvim-autopairs').setup({})

require('fzf-lua').setup({
  winopts = {
    width = 0.80,
    height = 0.78,
    row = 0.45,
    col = 0.48,
  },
})

local cmp = require('cmp')
cmp.setup({
  completion = {
    keyword_length = 1, -- TODO set this back 3, when fine with snippets
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<cr>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { 
      name = 'buffer',
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      },
    },
    { name = 'path' },
    { name = 'tmux', option = { all_panes = true } }, -- TODO 'true' makes things sloppy
    { name = 'calc' },
  }),

  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = "[Buffer]",
        calc = "[Calc]",
        nvim_lsp = "[LSP]",
        path = "[Path]",
        tmux = "[tmux]",
        vsnip = "[Snippet]",
      })[entry.source.name]
      return vim_item
    end
  },
})

-- vsnip config
g.vsnip_snippet_dirs = {
  os.getenv('HOME') .. '/Dotfiles/nvim/plugged/friendly-snippets/snippets',
  os.getenv('HOME') .. '/Dotfiles/snippets/',
}
g.vsnip_filetypes = {
  sass = { 'css' },
  scss = { 'css' },
  javascriptreact = { 'javascript' },
  typescriptreact = { 'typescript', 'javascript' },
}

-- floaterm
g.floaterm_width = 0.8
g.floaterm_height = 0.8
g.floaterm_autoclose = 1
g.floaterm_opener = 'edit'
g.floaterm_borderchars = '─│─│╭╮╯╰'
g.floaterm_title = ''
cmd("au VimEnter * highlight FloatermBorder guibg='#282828' guifg='#fbf1c7'")
