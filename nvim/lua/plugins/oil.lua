require('oil').setup({
  columns = {
    'mtime',
    'permissions',
    'size',
    'icon',
  },
  delete_to_trash = true,
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ["<esc>"] = "actions.close",
    ["q"] = "actions.close",
  },
})
