local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc and 'LSP: ' .. desc })
  end

  vim.keymap.set('n', '<leader>cr', function()
    return ':IncRename ' .. vim.fn.expand '<cword>'
  end, { buffer = bufnr, desc = '[C]ode [R]ename', expr = true })
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('<leader>cd', vim.diagnostic.open_float, '[C]ode [D]iagnostic')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = { disable = { 'missing-fields' } },
    },
  },
}

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'folke/neodev.nvim' },
    {
      'smjonas/inc-rename.nvim',
      config = function()
        require('inc_rename').setup()
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

    local lspconfig = require 'lspconfig'

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
    }
  end,
}
