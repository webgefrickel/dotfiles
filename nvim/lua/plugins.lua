return {
  -- The colorscheme of choice
  { 'luisiacc/gruvbox-baby',
    priority = 1000,
    config = function ()
      vim.opt.background = 'dark'
      vim.opt.termguicolors = true
      vim.g.gruvbox_baby_telescope_theme = 1
      vim.cmd('colorscheme gruvbox-baby')
      vim.cmd('language en_US.UTF-8')
    end
  },

  -- Libraries, icons and shared usage
  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'nvim-tree/nvim-web-devicons', lazy = true },
}
