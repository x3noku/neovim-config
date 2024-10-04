return {
  'NvChad/nvim-colorizer.lua',
  event = 'VeryLazy',
  config = function()
    require('colorizer').setup {
      filetypes = {
        '*',
        scss = { mode = 'virtualtext' },
        typescriptreact = { mode = 'background' },
      },
      user_default_options = {
        RRGGBBAA = true,                                -- #RRGGBBAA hex codes
        mode = 'foreground',                            -- Set the display mode.
        tailwind = true,
        sass = { enable = false, parsers = { 'css' } }, -- Enable sass colors
        virtualtext = '■',
        -- update color values even if buffer is not focused
        -- example use: cmp_menu, cmp_docs
        always_update = false,
      },
    }
  end,
}
