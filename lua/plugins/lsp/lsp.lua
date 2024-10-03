return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'folke/neodev.nvim' },
    {
      'smjonas/inc-rename.nvim',
      config = function()
        require('inc_rename').setup {}
      end,
    },
    {
      'SmiteshP/nvim-navbuddy',
      dependencies = {
        {
          'utilyre/barbecue.nvim',
          version = '*',
          dependencies = {
            'SmiteshP/nvim-navic',
            'nvim-tree/nvim-web-devicons',
          },
          config = function()
            require('barbecue').setup()
          end,
        },
        { 'SmiteshP/nvim-navic' },
        { 'MunifTanjim/nui.nvim' },
      },
      opts = {
        lsp = {
          auto_attach = true,
        },
      },
    },
    {
      'antosha417/nvim-lsp-file-operations',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-neo-tree/neo-tree.nvim',
      },
      config = function()
        require('lsp-file-operations').setup()
      end,
    },
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup()
    require('neodev').setup()

    local default_server = require 'plugins.lsp.servers.default'
    local lua_ls = require 'plugins.lsp.servers.lua_ls'

    local servers = {
      lua_ls = lua_ls,
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        if not servers[server_name] then
          default_server.setup(server_name, capabilities)
        else
          servers[server_name].setup(server_name, capabilities)
        end
      end,
    }
  end,
}
