-- return {}

return {
  'MunifTanjim/eslint.nvim',
  config = function()
    local eslint = require 'eslint'

    eslint.setup {
      bin = 'eslint', -- eslint | eslint_d
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
