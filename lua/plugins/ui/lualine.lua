return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = '',
      section_separators = '',
      -- section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff' },
      lualine_c = {
        { 'diagnostics' },
        { 'filetype',   icon_only = true, separator = '', padding = { left = 1, right = 0 } },
        { 'filename',   path = 1 },
      },
      lualine_x = {
        {
          function()
            return require('noice').api.status.command.get()
          end,
          cond = function()
            return require('noice').api.status.command.has()
          end,
        },
        {
          function()
            return string.match(require('noice').api.status.mode.get(), 'recording %@%w')
          end,
          cond = function()
            return require('noice').api.status.mode.has()
          end,
          color = { fg = '#ff9e64' },
        },
        {
          function()
            local search = require('noice').api.status.search.get()
            return string.match(search, '%/%w+') .. ' ' .. string.match(search, '%[%d+%/%d+%]')
          end,
          cond = function()
            return require('noice').api.status.search.has()
          end,
          color = { fg = '#ff9e64' },
        },
        -- {
        --   function()
        --     return '  ' .. require('dap').status()
        --   end,
        --   cond = function()
        --     return package.loaded['dap'] and require('dap').status() ~= ''
        --   end,
        --   color = Util.ui.fg 'Debug',
        -- },
      },
      lualine_y = {
        { 'progress', padding = { left = 2 } },
        { 'location' },
      },
      lualine_z = {
        function()
          return os.date '%R'
        end,
      },
    },
  },
}
