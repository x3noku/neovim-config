local lspconfig = require 'lspconfig'

local M = {}

local lsp_action = setmetatable({}, {
  __index = function(_, action)
    return function()
      vim.lsp.buf.code_action {
        apply = true,
        context = {
          only = { action },
          diagnostics = {},
        },
      }
    end
  end,
})

---@param client vim.lsp.Client
---@param bufnr boolean | number
local on_attach = function(client, bufnr)
  ---@param keys string
  ---@param func string | function
  ---@param desc string
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc and 'LSP: ' .. desc })
  end

  vim.keymap.set('n', '<leader>cr', function()
    return ':IncRename ' .. vim.fn.expand '<cword>'
  end, { buffer = bufnr, desc = '[C]ode [R]ename', expr = true })
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('<leader>cd', vim.diagnostic.open_float, '[C]ode [D]iagnostic')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', function()
    require('telescope.builtin').lsp_references { include_declaration = false }
  end, '[G]oto [R]eferences')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

  nmap('<leader>co', lsp_action['source.organizeImports'], '[C]ode [O]rganize imports')
  nmap('<leader>cm', lsp_action['source.addMissingImports.ts'], '[C]ode [M]issing imports')
  nmap('<leader>cu', lsp_action['source.removeUnused.ts'], '[C]ode Remove [U]nused imports')

  vim.api.nvim_create_user_command('TypescriptRestart', function()
    vim.lsp.buf_request(0, 'workspace/executeCommand', { command = 'typescript.restartTsServer' })
  end, { desc = 'Open Git vertically', nargs = '*' })

  client.commands['_typescript.moveToFileRefactoring'] = function(command)
    ---@type string, string, lsp.Range
    local action, uri, range = unpack(command.arguments)

    local function move(newf)
      client.request('workspace/executeCommand', {
        command = command.command,
        arguments = { action, uri, range, newf },
      })
    end

    local fname = vim.uri_to_fname(uri)
    client.request('workspace/executeCommand', {
      command = 'typescript.tsserverRequest',
      arguments = {
        'getMoveToRefactoringFileSuggestions',
        {
          file = fname,
          startLine = range.start.line + 1,
          startOffset = range.start.character + 1,
          endLine = range['end'].line + 1,
          endOffset = range['end'].character + 1,
        },
      },
    }, function(_, result)
      ---@type string[]
      local files = result.body.files
      table.insert(files, 1, 'Enter new path...')
      vim.ui.select(files, {
        prompt = 'Select move destination:',
        format_item = function(f)
          return vim.fn.fnamemodify(f, ':~:.')
        end,
      }, function(f)
        if f and f:find '^Enter new path' then
          vim.ui.input({
            prompt = 'Enter move destination:',
            default = vim.fn.fnamemodify(fname, ':h') .. '/',
            completion = 'file',
          }, function(newf)
            return newf and move(newf)
          end)
        elseif f then
          move(f)
        end
      end)
    end)
  end
end

local settings = {
  complete_function_calls = true,
  vtsls = {
    enableMoveToFileCodeAction = true,
    autoUseWorkspaceTsdk = true,
    experimental = {
      completion = {
        enableServerSideFuzzyMatch = true,
      },
    },
  },
  typescript = {
    updateImportsOnFileMove = { enabled = 'always' },
    suggest = {
      completeFunctionCalls = true,
    },
    inlayHints = {
      enumMemberValues = { enabled = true },
      functionLikeReturnTypes = { enabled = true },
      parameterNames = { enabled = 'literals' },
      parameterTypes = { enabled = true },
      propertyDeclarationTypes = { enabled = true },
      variableTypes = { enabled = false },
    },
  },
}

local filetypes = {
  'javascript',
  'javascriptreact',
  'javascript.jsx',
  'typescript',
  'typescriptreact',
  'typescript.tsx',
}

M.enabled = true

M.setup = function(server_name, capabilities)
  lspconfig[server_name].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = settings,
    filetypes = filetypes,
  }
end

return M
