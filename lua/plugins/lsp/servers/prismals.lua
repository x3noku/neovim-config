local M = {}

local on_attach = nil

local settings = nil

local filetypes = nil

M.enabled = true

M.setup = function(server_name, capabilities)
  vim.lsp.config(server_name, {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = settings,
    filetypes = filetypes,
  })

  vim.lsp.enable(server_name)
end

return M
