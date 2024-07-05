return {
  { 'hrsh7th/vim-vsnip',
    dependencies = {
      'hrsh7th/cmp-vsnip',
      'rafamadriz/friendly-snippets',
    },
    config = function ()
      vim.g.vsnip_snippet_dirs = {
        os.getenv('HOME') .. '/.local/share/nvim/lazy/friendly-snippets/snippets/',
        os.getenv('HOME') .. '/Dotfiles/snippets/',
      }

      vim.g.vsnip_filetypes = {
        scss = { 'scss', 'css' },
        javascriptreact = { 'javascript' },
        typescriptreact = { 'typescript', 'javascript' },
      }
    end
  }
}
