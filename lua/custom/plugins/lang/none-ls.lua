local group = vim.api.nvim_create_augroup('lsp_format_on_save', { clear = false })
local event = 'BufWritePre' -- or "BufWritePost"
local async = event == 'BufWritePost'

return {
  'nvimtools/none-ls.nvim',
  opts = function(_, opts)
    local nls = require 'null-ls'

    opts.sources = vim.list_extend(opts.sources or {}, {
      -- nls.builtins.formatting.shfmt,
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.prettierd,
      -- nls.builtins.formatting.prettier,
      nls.builtins.formatting.clang_format,
    })
    opts.on_attach = function(client, bufnr)
      if client.supports_method 'textDocument/formatting' then
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = group }
        vim.api.nvim_create_autocmd(event, {
          buffer = bufnr,
          group = group,
          callback = function()
            vim.lsp.buf.format { bufnr = bufnr, async = async }
          end,
          desc = 'LSP: Format on save',
        })
      end
    end
  end,
}
