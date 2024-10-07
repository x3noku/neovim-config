local lspconfig = require 'lspconfig'

local M = {}

local on_attach = nil

local settings = {
  json = {
    format = {
      enable = true,
    },
    validate = { enable = true },
  },
}

local filetypes = nil

local on_new_config = function(new_config)
  new_config.settings.json.schemas = new_config.settings.json.schemas or {}
  vim.list_extend(new_config.settings.json.schemas, require('schemastore').json.schemas())
end

M.enabled = true

M.setup = function(server_name, capabilities)
  lspconfig[server_name].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    on_new_config = on_new_config,
    settings = settings,
    filetypes = filetypes,
  }
end

return M
