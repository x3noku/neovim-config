return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    { 'folke/neodev.nvim',       opts = {} },
    { 'smjonas/inc-rename.nvim', opts = {} },
    {
      'utilyre/barbecue.nvim',
      version = '*',
      dependencies = {
        'SmiteshP/nvim-navic',
      },
      opts = {},
    },
    {
      'antosha417/nvim-lsp-file-operations',
      dependencies = { 'nvim-lua/plenary.nvim', 'nvim-neo-tree/neo-tree.nvim' },
      opts = {},
    },
  },
  opts = {
    ---@type vim.diagnostic.Opts
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 4,
        source = 'if_many',
        prefix = '●',
      },
      severity_sort = true,
    },
    -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
    -- Be aware that you also will need to properly configure your LSP server to
    -- provide the inlay hints.
    inlay_hints = {
      enabled = true,
      -- exclude = { 'vue' }, -- filetypes for which you don't want to enable inlay hints
    },
    -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
    -- Be aware that you also will need to properly configure your LSP server to
    -- provide the code lenses.
    codelens = {
      enabled = false,
    },
    -- Enable lsp cursor word highlighting
    document_highlight = {
      enabled = true,
    },
    -- -- add any global capabilities here
    -- capabilities = {
    --   workspace = {
    --     fileOperations = {
    --       didRename = true,
    --       willRename = true,
    --     },
    --   },
    -- },
    -- options for vim.lsp.buf.format
    -- `bufnr` and `filter` is handled by the LazyVim formatter,
    -- but can be also overridden when specified
    format = {
      formatting_options = nil,
      timeout_ms = nil,
    },
  },
  config = function(_, opts)
    -- -- diagnostics signs
    -- if vim.fn.has 'nvim-0.10.0' == 0 then
    --   if type(opts.diagnostics.signs) ~= 'boolean' then
    --     for severity, icon in pairs(opts.diagnostics.signs.text) do
    --       local name = vim.diagnostic.severity[severity]:lower():gsub('^%l', string.upper)
    --       name = 'DiagnosticSign' .. name
    --       vim.fn.sign_define(name, { text = icon, texthl = name, numhl = '' })
    --     end
    --   end
    -- end
    --
    -- vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    local default_server = require 'plugins.lsp.servers.default'

    local servers = {
      tsserver = { enabled = false },
      ts_ls = { enabled = false },

      css_variables = require 'plugins.lsp.servers.css_variables',
      cssls = require 'plugins.lsp.servers.cssls',
      cssmodules_ls = require 'plugins.lsp.servers.cssmodules_ls',
      jsonls = require 'plugins.lsp.servers.jsonls',
      lua_ls = require 'plugins.lsp.servers.lua_ls',
      prismals = require 'plugins.lsp.servers.prismals',
      tailwindcss = require 'plugins.lsp.servers.tailwindcss',
      vtsls = require 'plugins.lsp.servers.vtsls',
    }

    local has_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    local capabilities = vim.tbl_deep_extend(
      'force',
      {},
      vim.lsp.protocol.make_client_capabilities(),
      has_cmp and cmp_nvim_lsp.default_capabilities() or {},
      opts.capabilities or {}
    )

    -- get all the servers that are available through mason-lspconfig
    local has_mason, mason_lspconfig = pcall(require, 'mason-lspconfig')
    local all_mslp_servers = has_mason and vim.tbl_keys(require('mason-lspconfig.mappings.server').lspconfig_to_package)
        or {}

    local ensure_installed = {} ---@type string[]
    for server_name, server_opts in pairs(servers) do
      if server_opts.enabled ~= false and vim.tbl_contains(all_mslp_servers, server_name) then
        ensure_installed[#ensure_installed + 1] = server_name
      end
    end

    if has_mason then
      mason_lspconfig.setup { ensure_installed = ensure_installed }

      mason_lspconfig.setup_handlers {
        function(server_name)
          if not servers[server_name] then
            default_server.setup(server_name, capabilities)
          else
            servers[server_name].setup(server_name, capabilities)
          end
        end,
      }
    end
  end,
}
