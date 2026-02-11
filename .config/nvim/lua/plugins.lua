vim.pack.add({
  'https://github.com/sainnhe/gruvbox-material',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/stevearc/dressing.nvim',
  'https://github.com/MagicDuck/grug-far.nvim',
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
  'https://github.com/catgoose/nvim-colorizer.lua',
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/kevinhwang91/nvim-bqf',
  'https://github.com/mikavilpas/yazi.nvim',
  'https://github.com/numToStr/Navigator.nvim',
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/sphamba/smear-cursor.nvim',
  'https://github.com/windwp/nvim-ts-autotag',
  { src = 'https://github.com/gruvw/strudel.nvim', build = 'npm ci' },
})

vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_enable_bold = 1
vim.cmd.colorscheme('gruvbox-material')
vim.cmd.language('en_US.UTF-8')

require('Navigator').setup()
require('colorizer').setup({ user_default_options = { tailwind = true } })
require('fzf-lua').setup({ grep = { hidden = true } })
require('mini.basics').setup()
require('mini.bracketed').setup()
require('mini.comment').setup()
require('mini.diff').setup()
require('mini.git').setup()
require('mini.icons').setup()
require('mini.move').setup({ options = { reindent_linewise = false } })
require('mini.splitjoin').setup()
require('mini.statusline').setup()
require('mini.surround').setup()
require('nvim-ts-autotag').setup()
require('render-markdown').setup({ completions = { lsp = { enabled = true } } })
require('smear_cursor').setup({ smear_between_neighbor_lines = false })
require('strudel').setup()
require('yazi').setup({ open_for_directories = true })
