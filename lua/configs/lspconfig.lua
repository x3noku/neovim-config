local lspconfig = require('lspconfig')
local navic = require('nvim-navic')
local mason_servers = require('configs.mason-lspconfig').ensure_installed
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.handlers['textDocument/hover'] = lsp.with(
    lsp.handlers.hover, {
        border = 'rounded'
    }
)

local navic_servers = { 'clangd', 'gopls', 'html', 'jsonls', 'jdtls', 'tsserver', 'julials', 'kotlin_language_server', 'luau_lsp', 'pyright'  }

local function supports_navic(server)
    for i=1,#navic_servers do
        if navic_servers[i] == server then
            return true
        end
    end

    return false
end

for _, server in pairs(mason_servers) do
    lspconfig[server].setup({
        capabilities = capabilities,
        on_attach = function (client, bufnr) 
            if supports_navic(server) then
                navic.attach(client, bufnr)
            end
        end
    })
end
