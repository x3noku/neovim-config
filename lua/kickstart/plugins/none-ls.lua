return {
  'nvimtools/none-ls.nvim',
  opts = function(_, opts)
    local nls = require 'null-ls'

    opts.sources = vim.list_extend(opts.sources or {}, {
      -- nls.builtins.formatting.fish_indent,
      -- nls.builtins.diagnostics.fish,
      -- nls.builtins.formatting.stylua,
      -- nls.builtins.formatting.shfmt,
      nls.builtins.formatting.stylua,
      nls.builtins.diagnostics.eslint,
      nls.builtins.formatting.eslint,
      nls.builtins.completion.spell,
    })
    -- opts.on_attach = function(client, bufnr)
    --   if client.supports_method('textDocument/formatting') then
    --     vim.api.nvim_create_autocmd('BufWritePre', {
    --       buffer = bufnr,
    --       callback = function()
    --         print(client.name)
    --         vim.cmd('EslintFixAll')
    --         -- vim.lsp.buf.format({ bufnr = bufnr })
    --       end,
    --     })
    --   end
    -- end
  end,
}
