local lspconfig = require 'lspconfig'

local M = {}

local on_attach = nil

local settings = {
  tailwindcss = {
    filetypes_exclude = { 'markdown' },
    filetypes_include = {},
  },
}

local filetypes = nil

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
