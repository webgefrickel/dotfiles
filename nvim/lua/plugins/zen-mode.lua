require('zen-mode').setup({
  window = {
    backdrop = 0.95,
    width = 120,
    height = 0.85,
    options = {
      signcolumn = "no", -- disable signcolumn
      number = false, -- disable number column
      relativenumber = false, -- disable relative numbers
    },
  },
  plugins = {
    gitsigns = { enabled = true },
    wezterm = {
      enabled = true,
      font = "+2",
    },
  },
})
