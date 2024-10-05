if vim.g.iconset == 'mini.icons' then
  return {
    'echasnovski/mini.icons',
    version = '*',
    config = function()
      local mini_icons = require 'mini.icons'

      mini_icons.setup {}
      mini_icons.mock_nvim_web_devicons()
    end,
  }
end

return {
  'nvim-tree/nvim-web-devicons',
  lazy = true,
}
