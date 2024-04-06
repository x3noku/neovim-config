return {
  {
    'rmehri01/onenord.nvim',
    lazy = true,
  },
  {
    'sainnhe/sonokai',
    lazy = true,
  },
  {
    'navarasu/onedark.nvim',
    lazy = true,
  },
  {
    'savq/melange-nvim',
    lazy = true,
  },
  {
    'zootedb0t/citruszest.nvim',
    lazy = true,
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = true,
  },
  {
    'justinsgithub/oh-my-monokai.nvim',
    lazy = true,
  },
  {
    'NTBBloodbath/sweetie.nvim',
    lazy = false,
  },
  {
    'nyoom-engineering/oxocarbon.nvim',
    lazy = true,
  },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    {
      'scottmckendry/cyberdream.nvim',
      lazy = false,
      priority = 1000,
      config = function()
        require('cyberdream').setup {
          -- Recommended - see "Configuring" below for more config options
          transparent = false,
          italic_comments = true,
          hide_fillchars = true,
          borderless_telescope = true,
          terminal_colors = true,
        }
      end,
    },
  },
  {
    'tiagovla/tokyodark.nvim',
    lazy = true,
  },
  {
    'olivercederborg/poimandres.nvim',
    lazy = false,
  },
}
