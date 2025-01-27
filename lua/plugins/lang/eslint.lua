--- @type 'eslint' | 'eslint_d'
local bin = 'eslint_d' -- usually `eslint` works much slower

return {
  'MunifTanjim/eslint.nvim',

  mason_install = bin == 'eslint' and 'eslint-lsp' or 'eslint_d',
  mason_remove = bin ~= 'eslint' and 'eslint-lsp' or 'eslint_d',

  dependencies = {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvimtools/none-ls-extras.nvim' },
    opts = function(_, opts)
      if bin == 'eslint' then
        opts.sources = vim.list_extend(opts.sources or {}, {
          require('none-ls.formatting.' .. bin).with {
            -- ignore prettier warnings from eslint-plugin-prettier
            filter = function(diagnostic)
              return diagnostic.code ~= 'prettier/prettier'
            end,
          },
        })
      end

      if bin == 'eslint_d' then
        opts.sources = vim.list_extend(opts.sources or {}, {
          require('none-ls.diagnostics.' .. bin).with {
            -- ignore prettier warnings from eslint-plugin-prettier
            filter = function(diagnostic)
              return diagnostic.code ~= 'prettier/prettier'
            end,
          },
          require('none-ls.formatting.' .. bin),
        })
      end
    end,
  },
  config = function()
    require('eslint').setup {
      bin = bin,
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
