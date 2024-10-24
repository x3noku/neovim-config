local lspconfig = require 'lspconfig'

local M = {}

local on_attach = nil

local settings = {
  css = {
    validate = true,
    lint = {
      unknownAtRules = 'ignore',
    },
  },
  less = {
    validate = true,
    lint = {
      unknownAtRules = 'ignore',
    },
  },
  scss = {
    validate = true,
    lint = {
      unknownAtRules = 'ignore',
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
