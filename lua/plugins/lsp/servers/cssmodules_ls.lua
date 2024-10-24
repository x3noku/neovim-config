local lspconfig = require 'lspconfig'

local M = {}

local on_attach = nil

local settings = nil

local filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }

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
