local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

function get_config(name)
  return string.format('require("config/%s")', name)
end

-- bootstrapping / downloading packer. run :PackerSync afterwards if sth. fails
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

return require('packer').startup(function(use)
  -- packer for plugin management itself
  use 'wbthomason/packer.nvim'

  -- Treesitter for nicer syntax-highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    config = get_config('treesitter'),
    run = ':TSUpdate',
  }

  -- textobjects, surround, for stuff like cs", cib etc.
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use {
    'ur4ltz/surround.nvim',
    config = get_config('surround'),
  }

  -- lsp and null-ls for diagnostics and formatting (eslint_d, stylelint etc.)
  -- remember to install all those tools in the cli, see ../../install/3_vimux.sh
  use {
    'neovim/nvim-lspconfig',
    config = get_config('lspconfig'),
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = get_config('null-ls'),
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- autocompletion and snippets
  use {
    'hrsh7th/nvim-cmp',
    config = get_config('cmp'),
    requires = {
      'andersevenrud/cmp-tmux',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
    },
  }
  use {
    'hrsh7th/vim-vsnip',
    config = get_config('vsnip'),
  }
  use {
    'rafamadriz/friendly-snippets',
    requires = {
      'hrsh7th/vim-vsnip',
    },
  }

  -- floating-terminal integration for nnn, lazygit etc.
  use {
    'voldikss/vim-floaterm',
    config = get_config('floaterm'),
  }

  -- fzf integration
  use {
    'ibhagwan/fzf-lua',
    config = get_config('fzf'),
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- autopairs for sensible () "" ''
  use {
    'windwp/nvim-autopairs',
    config = get_config('autopairs'),
  }

  -- colorizer for nice css-colors
  use {
    'norcalli/nvim-colorizer.lua',
    config = get_config('colorizer'),
    event = 'BufReadPre',
  }

  -- commenting stuff out
  use {
    'numToStr/Comment.nvim',
    config = get_config('comment'),
  }

  -- nice status line
  use {
    'nvim-lualine/lualine.nvim',
    config = get_config('lualine'),
    requires = { 'kyazdani42/nvim-web-devicons' },
    event = 'VimEnter',
  }

  -- leap for stupidly nice navigation
  use {
    'ggandor/leap.nvim',
    config = get_config('leap'),
    event = 'BufReadPre',
  }

  -- git diff view and blame, using lazygit for everything else
  use {
    'sindrets/diffview.nvim',
    config = get_config('diffview'),
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- finally: the colorscheme of choice
  use {
    'ellisonleao/gruvbox.nvim',
    requires = { 'rktjmp/lush.nvim' },
  }

  -- Evaluating...
  use {
    'rcarriga/nvim-notify',
    config = get_config('notify'),
  }
  use {
    'nvim-neorg/neorg',
    config = get_config('neorg'),
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use {
    'folke/trouble.nvim',
    config = get_config('trouble'),
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- oldschool vimscript plugins that still provide a lot of value
  use 'christoomey/vim-tmux-navigator'
  use 'editorconfig/editorconfig-vim'
  use 'tpope/vim-repeat'
  use 'tpope/vim-ragtag'
  use 'wincent/terminus'

  -- automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
