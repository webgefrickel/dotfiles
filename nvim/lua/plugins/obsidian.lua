require('obsidian').setup({
  dir = '~/Notes',
  follow_url_func = function(url)
    vim.fn.jobstart({'open', url})
  end,
})
