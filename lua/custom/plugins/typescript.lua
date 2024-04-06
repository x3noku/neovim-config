return {
  'pmizio/typescript-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
    {
      'smjonas/inc-rename.nvim',
      config = function()
        require('inc_rename').setup {
          show_message = false,
        }
      end,
    },
  },
  opts = {},
  config = function()
    require('typescript-tools').setup {
      on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc and 'LSP: ' .. desc })
        end

        nmap('<leader>cr', ':IncRename ', '[C]ode [R]ename')
        nmap('<leader>cR', '<cmd>TSToolsRenameFile<cr>', '[C]ode [R]ename file')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        nmap('<leader>cd', vim.diagnostic.open_float, '[C]ode [D]iagnostic')
        nmap('<leader>co', '<cmd>TSToolsOrganizeImports<cr>', '[C]ode [O]rganize imports')

        nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

        nmap('<leader>F', '<cmd>!eslint_d --cache "%" --fix<cr>', '[F]ormat')
      end,
      settings = {
        jsx_close_tag = {
          enable = true,
          filetypes = { 'javascriptreact', 'typescriptreact' },
        },
      },
    }
  end,
}
