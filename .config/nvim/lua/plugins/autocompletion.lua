return {
  { 'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
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
      },
    },
  },
  { 'yetone/avante.nvim',
    lazy = false,
    event = 'VeryLazy',
    build = 'make',
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
