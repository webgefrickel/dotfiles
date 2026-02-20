-- treesitter
local languages = {
  'bash',
  'c',
  'comment',
  'css',
  'diff',
  'dockerfile',
  'editorconfig',
  'git_config',
  'gitcommit',
  'gitignore',
  'glimmer',
  'html',
  'htmldjango',
  'http',
  'ini',
  'javascript',
  'jinja',
  'jsdoc',
  'json',
  'json5',
  'lua',
  'make',
  'markdown',
  'markdown_inline',
  'muttrc',
  'php',
  'python',
  'query',
  'regex',
  'ruby',
  'scss',
  'sql',
  'ssh_config',
  'toml',
  'tsx',
  'twig',
  'typescript',
  'vim',
  'vimdoc',
  'vue',
  'xml',
  'yaml',
  'zsh',
}

vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

require('nvim-treesitter').setup({ install_dir = vim.fn.stdpath('data') .. '/site' })
require('nvim-treesitter').install(languages)

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function()
    require('nvim-treesitter').update()
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = languages,
  callback = function(args)
    vim.treesitter.start(args.buf)
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
})

-- LSP and mason
local lsp_servers = {
  ast_grep = {},
  bashls = {},
  css_variables = {},
  cssls = {},
  cssmodules_ls = {},
  emmet_language_server = {},
  eslint = {},
  html = {},
  jsonls = {},
  lua_ls = {
    Lua = { workspace = { library = vim.api.nvim_get_runtime_file("lua", true) }, },
  },
  marksman = {},
  phpactor = {},
  stylelint_lsp = {},
  tailwindcss = {},
  vtsls = {},
  yamlls = {},
}

vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
})

require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
  ensure_installed = vim.tbl_keys(lsp_servers)
})

for server, config in pairs(lsp_servers) do
  vim.lsp.config(server, { settings = config })
end
