return {
  { 'folke/trouble.nvim', config = true },
  { 'folke/todo-comments.nvim', config = true },
  { 'norcalli/nvim-colorizer.lua',
    opts = {
      css = { css = true },
      scss = { css = true },
      json = { css = true},
      json5 = { css = true, },
      javascript = { css = true },
    },
  },
  { 'epwalsh/obsidian.nvim',
    ft = 'markdown',
    opts = {
      dir = '~/Notes',
      follow_url_func = function(url)
        vim.fn.jobstart({'open', url})
      end,
    }
  },
}
