local eslint = require 'plugins.lang.eslint'

return {
  'williamboman/mason.nvim',
  dependencies = {
    { 'williamboman/mason-lspconfig.nvim', opts = {} },
  },
  cmd = 'Mason',
  build = ':MasonUpdate',
  opts_extend = { 'ensure_installed' },
  opts = {
    ensure_installed = {
      'stylua',
      'shfmt',
      'biome',
      'jsonlint',
      'prettierd',
      eslint.mason_install,
    },
  },
  config = function(_, opts)
    require('mason').setup(opts)

    local mr = require 'mason-registry'
    mr.refresh(function()
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end

      local p = mr.get_package(eslint.mason_remove)
      if p:is_installed() then
        p:uninstall()
      end
    end)
  end,
}
