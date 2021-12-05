lua << EOF

-- LSP-config
require('lspconfig').eslint.setup({})
require('lspconfig').jsonls.setup({})
require('lspconfig').html.setup({})
require('lspconfig').yamlls.setup({})
require('lspconfig').tsserver.setup({})
require('lspconfig').phpactor.setup({})

require('lspconfig').stylelint_lsp.setup({
  filetypes = { 'css', 'sass', 'scss' }
})

require('lspconfig').cssls.setup({
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

EOF

" Snippets
imap <expr> <C-j> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>'
smap <expr> <C-j> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>'

let g:vsnip_snippet_dirs = [expand('~/Dotfiles/nvim/plugged/friendly-snippets/snippets'), expand('~/Dotfiles/snippets')]
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.sass = ['css']
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

" fugitive
nnoremap <leader>gs :G<cr><C-w>20+
nnoremap <leader>gd :Gvdiff<cr><C-w>20+
nnoremap <leader>gc :Git commit<cr><C-w>20+
nnoremap <leader>gw :Gwrite<cr><C-w>20+
nnoremap <leader>gb :Git blame<cr><C-w>20+

" fzf
nnoremap <leader>, <cmd>lua require('fzf-lua').files()<cr>
nnoremap <leader>` <cmd>lua require('fzf-lua').files({ cwd = '~/' })<cr>
nnoremap <leader>. <cmd>lua require('fzf-lua').buffers()<cr>
nnoremap <leader>l <cmd>lua require('fzf-lua').lines()<cr>
nnoremap <leader>a <cmd>lua require('fzf-lua').grep_project()<cr>
nnoremap <leader>; <cmd>lua require('fzf-lua').command_history()<cr>
nnoremap <leader>/ <cmd>lua require('fzf-lua').search_history()<cr>
nnoremap <leader>c <cmd>lua require('fzf-lua').git_commits()<cr>
nnoremap <leader>b <cmd>lua require('fzf-lua').git_branches()<cr>

" LSP
nnoremap <leader>f <cmd>lua vim.lsp.buf.formatting()<cr>

" Hop
nnoremap <space>j <cmd>lua require('hop').hint_words()<cr>

" Floaterm
let g:floaterm_keymap_toggle = '<space>t'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_autoclose = 1
let g:floaterm_opener = 'edit'
let g:floaterm_borderchars = '─│─│╭╮╯╰'
let g:floaterm_title = ''
hi FloatermBorder guibg='#282828' guifg='#fbf1c7'
nnoremap - :FloatermNew nnn<cr>
nnoremap <space>g :FloatermNew lazygit<cr>

