local event = 'BufWritePre' -- or "BufWritePost"
local async = event == 'BufWritePost'

local context_manager = require 'plenary.context_manager'
local with = context_manager.with
local open = context_manager.open

local function package_has_prettier()
  local path = vim.fs.find({
    'package.json',
  }, {})[1]

  if not path then
    return false
  end

  return with(open(path), function(reader)
    local json = vim.fn.json_decode(reader:read '*a')
    return json['prettier'] ~= nil
  end)
end

local function biome_or_prettier(bufnr)
  local has_biome = vim.lsp.get_clients({
    bufnr = bufnr,
    name = 'biome',
  })[1]

  if has_biome then
    return { 'biome' }
  end

  local has_prettier = package_has_prettier()
    or vim.fs.find({
      -- https://prettier.io/docs/en/configuration.html
      '.prettierrc',
      '.prettierrc.json',
      '.prettierrc.yml',
      '.prettierrc.yaml',
      '.prettierrc.json5',
      '.prettierrc.js',
      '.prettierrc.cjs',
      '.prettierrc.toml',
      'prettier.config.js',
      'prettier.config.cjs',
    }, { upward = true })[1]

  if has_prettier then
    return { 'prettierd' }
  end

  return { 'biome' }
end

return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  cmd = { 'ConformInfo' },
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    format_on_save = {
      async = async,
      timeout_ms = 3000,
      lsp_fallback = true,
    },
    formatters = {
      yamlfix = {
        env = {
          YAMLFIX_EXPLICIT_START = false,
          YAMLFIX_SEQUENCE_STYLE = 'keep_style',

          YAMLFIX_SECTION_WHITELINES = 1,
          YAMLFIX_WHITELINES = 1,

          YAMLFIX_INDENT_MAPPING = 4,
          YAMLFIX_INDENT_OFFSET = 2,
          YAMLFIX_INDENT_SEQUENCE = 4,
        },
      },
    },
    formatters_by_ft = {
      bash = { 'shfmt' },
      sh = { 'shfmt' },
      lua = { 'stylua' },
      yaml = { 'yamlfix' },

      javascript = biome_or_prettier,
      typescript = biome_or_prettier,
      javascriptreact = biome_or_prettier,
      typescriptreact = biome_or_prettier,

      css = biome_or_prettier,
      scss = biome_or_prettier,
      less = biome_or_prettier,
      html = biome_or_prettier,

      json = biome_or_prettier,
      jsonc = biome_or_prettier,

      markdown = { 'biome' },
    },
  },
  config = function(_, opts)
    local conform = require 'conform'

    conform.setup(opts)

    vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
      conform.format {
        async = async,
        timeout_ms = 3000,
        lsp_fallback = true,
      }
    end, { desc = '[C]ode [F]ormat' })
  end,
}
