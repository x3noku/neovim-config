return {
  'nvimtools/none-ls.nvim',
  opts = function(_, opts)
    local nls = require 'null-ls'

    opts.sources = vim.list_extend(opts.sources or {}, {
      -- nls.builtins.formatting.shfmt,
      nls.builtins.formatting.stylua,
      -- nls.builtins.diagnostics.eslint_d,
      -- nls.builtins.formatting.prettierd,
    })
    opts.on_attach = function(client, bufnr)
      if client.supports_method 'textDocument/formatting' then
        vim.api.nvim_create_autocmd('BufWritePre', {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format {
              bufnr = bufnr,
              filter = function(c)
                return c.id == client.id
              end,
            }
          end,
        })
      end
    end
  end,
}
