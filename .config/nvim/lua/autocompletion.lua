vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
  'https://github.com/rafamadriz/friendly-snippets',
})

require('blink.cmp').setup({
  keymap = { preset = 'super-tab' },
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
})
