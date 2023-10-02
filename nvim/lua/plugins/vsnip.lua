local g = vim.g

g.vsnip_snippet_dirs = {
  os.getenv('HOME') .. '/.local/share/nvim/lazy/friendly-snippets/snippets/',
  os.getenv('HOME') .. '/Dotfiles/snippets/',
}

g.vsnip_filetypes = {
  scss = { 'scss', 'css' },
  javascriptreact = { 'javascript' },
  typescriptreact = { 'typescript', 'javascript' },
}
