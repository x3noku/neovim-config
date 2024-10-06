local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]
logo = string.rep('\n', 8) .. logo .. '\n\n'

return {
  'nvimdev/dashboard-nvim',
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    local opts = {
      theme = 'doom',
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = true,
      },
      config = {
        header = vim.split(logo, '\n'),
        -- stylua: ignore
        center = {
          -- { action = "Mason", desc = " Mason", icon = " ", key = "m" },
          -- { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit", icon = " ", key = "q" },
        },
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
      button.key_format = '  %s'
    end

    -- open dashboard after closing lazy
    if vim.o.filetype == 'lazy' then
      vim.api.nvim_create_autocmd('WinClosed', {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds('UIEnter', { group = 'dashboard' })
          end)
        end,
      })
    end

    return opts
  end,
}
