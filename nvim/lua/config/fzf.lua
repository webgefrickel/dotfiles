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
    width = 0.98,
    height = 0.89,
    row = 0.55,
    col = 0.48,
  },
})
