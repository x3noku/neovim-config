local lspconfig = require 'lspconfig'

local M = {}

---@param _ vim.lsp.Client
---@param bufnr boolean | number
local on_attach = function(_, bufnr)
  ---@param keys string
  ---@param func string | function
  ---@param desc string
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc and 'LSP: ' .. desc })
  end

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', function()
    require('telescope.builtin').lsp_references { include_declaration = false }
  end, '[G]oto [R]eferences')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
end

local settings = {
  cssVariables = {
    lookupFiles = { '**/*.less', '**/*.scss', '**/*.sass', '**/*.css' },
    blacklistFolders = {
      '**/.cache',
      '**/.DS_Store',
      '**/.git',
      '**/.hg',
      '**/.next',
      '**/.svn',
      '**/bower_components',
      '**/CVS',
      '**/dist',
      '**/node_modules',
      '**/tests',
      '**/tmp',
    },
  },
}

local filetypes = { 'css', 'scss', 'less' }

M.enabled = true

M.setup = function(server_name, capabilities)
  lspconfig[server_name].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = settings,
    filetypes = filetypes,
  }
end

return M
