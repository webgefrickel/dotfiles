require('fzf-lua').setup({
  files = {
    multiprocess = true,
  },
  grep = {
    multiprocess = true,
  },
  git = {
    files = {
      multiprocess = true,
    },
  },
  winopts = {
    width = 0.80,
    height = 0.78,
    row = 0.45,
    col = 0.48,
  },
})
