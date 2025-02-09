local eslint = require 'plugins.lang.eslint'
local group = vim.api.nvim_create_augroup('lsp_lint_on_save', { clear = true })

local function biome_or_eslint(bufnr)
  local has_biome_lsp = vim.lsp.get_clients({
    bufnr = bufnr,
    name = 'biome',
  })[1]

  if has_biome_lsp then
    return { 'biomejs' }
  end

  local has_eslint = vim.fs.find({
    -- https://prettier.io/docs/en/configuration.html
    'eslint.config.js',
    'eslint.config.mjs',
    'eslint.config.cjs',
    'eslint.config.ts',
    'eslint.config.mts',
    'eslint.config.cts',

    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.yaml',
    '.eslintrc.yml',
    '.eslintrc.json',
  }, { upward = true })[1]

  if has_eslint then
    return { eslint.bin }
  end

  return { 'biomejs' }
end

return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    linters_by_ft = {
      bash = { 'shfmt' },
      sh = { 'shfmt' },
      lua = { 'stylua' },

      javascript = biome_or_eslint,
      typescript = biome_or_eslint,
      javascriptreact = biome_or_eslint,
      typescriptreact = biome_or_eslint,

      css = biome_or_eslint,
      scss = biome_or_eslint,
      less = biome_or_eslint,
      html = biome_or_eslint,

      json = biome_or_eslint,
      jsonc = biome_or_eslint,
      yaml = biome_or_eslint,

      markdown = biome_or_eslint,
    },
  },
  config = function()
    local lint = require 'lint'

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = group,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set('n', '<leader>cl', function()
      lint.try_lint()
    end, { desc = '[C]ode [L]int' })
  end,
}
