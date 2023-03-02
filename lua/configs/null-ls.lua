local builtins = require('null-ls').builtins

return {
    sources = {
        builtins.diagnostics.eslint_d,
        builtins.formatting.eslint_d,
        builtins.formatting.fixjson,
    },
    on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = bufnr,
                callback = function()
                    lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
}
