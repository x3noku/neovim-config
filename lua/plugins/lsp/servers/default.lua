local lspconfig = require 'lspconfig'

local M = {}

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc and 'LSP: ' .. desc })
  end

  vim.keymap.set('n', '<leader>cr', function()
    return ':IncRename ' .. vim.fn.expand '<cword>'
  end, { buffer = bufnr, desc = '[C]ode [R]ename', expr = true })
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('<leader>cd', vim.diagnostic.open_float, '[C]ode [D]iagnostic')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
end

local settings = nil

local filetypes = nil

M.setup = function(server_name, capabilities)
  lspconfig[server_name].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = settings,
    filetypes = filetypes,
  }
end

return M
