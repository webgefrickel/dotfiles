return {
  { 'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*', -- use a release tag to download pre-built binaries
    lazy = false,
    opts = {
      keymap = { preset = 'super-tab' },
      sources = {
        default = { 'snippets', 'lsp', 'path', 'buffer' },
      },
      completion = {
        trigger = { show_in_snippet = false },
        documentation = { auto_show = true },
        list = {
          selection = {
            auto_insert = false,
            preselect = function()
              return not require('blink.cmp').snippet_active({ direction = 1 })
            end,
          },
        },
        menu = {
          draw = {
            columns = {
              { 'label', 'label_description', gap = 1 },
              { 'kind_icon', 'kind', gap = 1 },
              { 'source_name' },
            },
          },
        },
      },
    },
  },
  { 'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    build = 'make',
    version = '*',
    opts = {
      hints = { enabled = false },
      behaviour = { auto_set_keymaps = false },
      provider = 'openai',
      openai = {
        model = 'gpt-4o-mini',
      },
    },
  },
}
