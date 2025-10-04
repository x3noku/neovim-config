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

  vim.keymap.set('n', '<leader>cr', function()
    return ':IncRename ' .. vim.fn.expand '<cword>'
  end, { buffer = bufnr, desc = '[C]ode [R]ename', expr = true })
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('<leader>cd', vim.diagnostic.open_float, '[C]ode [D]iagnostic')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', function()
    require('telescope.builtin').lsp_references { include_declaration = false }
  end, '[G]oto [R]eferences')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
end

local settings = {
  Lua = {
    workspace = { checkThirdParty = false },
    telemetry = { enable = false },
    diagnostics = { disable = { 'missing-fields' } },
  },
}

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
