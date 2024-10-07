-- We are using `eslint` for diagnostics as it works better
-- But for formatting and fixing problems `eslint_d` is used as it is much faster

return {
  'MunifTanjim/eslint.nvim',
  dependencies = {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvimtools/none-ls-extras.nvim' },
    opts = function(_, opts)
      opts.sources = vim.list_extend(opts.sources or {}, {
        require 'none-ls.formatting.eslint_d',
      })
    end,
  },
  config = function()
    require('eslint').setup {
      bin = 'eslint',
      code_actions = {
        enable = true,
        apply_on_save = {
          enable = true,
          types = { 'directive', 'problem', 'suggestion', 'layout' },
        },
        disable_rule_comment = {
          enable = true,
          location = 'separate_line', -- separate_line | same_line
        },
      },
      diagnostics = {
        enable = true,
        report_unused_disable_directives = false,
        run_on = 'type', -- type | save
      },
    }
  end,
}
