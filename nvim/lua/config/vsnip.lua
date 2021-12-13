local g = vim.g

-- vsnip config
g.vsnip_snippet_dirs = {
  os.getenv('HOME') .. '/Dotfiles/nvim/plugged/friendly-snippets/snippets',
  os.getenv('HOME') .. '/Dotfiles/snippets/',
}
g.vsnip_filetypes = {
  sass = { 'css' },
  scss = { 'css' },
  javascriptreact = { 'javascript' },
  typescriptreact = { 'typescript', 'javascript' },
}
