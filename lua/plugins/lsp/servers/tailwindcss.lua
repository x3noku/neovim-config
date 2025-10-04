local M = {}

local on_attach = nil

local settings = {
  tailwindcss = {
    filetypes_exclude = { 'markdown' },
    filetypes_include = {},
  },
  tailwindCSS = {
    classAttributes = { 'class', 'className', 'class:list', 'classList', 'ngClass' },
    experimental = {
      classRegex = {
        'cva\\(([^)]*)\\)',
        '\\b\\w+[cC]lassName\\s*=\\s*["\']([^"\']*)["\']',
        '\\b\\w+[cC]lassName\\s*=\\s*`([^`]*)`',
        '[\\w]+[cC]lassName["\']?\\s*:\\s*["\']([^"\']*)["\']',
        '[\\w]+[cC]lassName["\']?\\s*:\\s*`([^`]*)`',
        'className["\']?\\s*:\\s*["\']([^"\']*)["\']',
        'className["\']?\\s*:\\s*`([^`]*)`',
      },
    },
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
