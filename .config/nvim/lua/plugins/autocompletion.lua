return {
  { 'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '1.*',
    opts = {
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
    },
  },
}
