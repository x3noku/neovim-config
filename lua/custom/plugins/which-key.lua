return {
  'folke/which-key.nvim',
  opts = {
    -- window = {
    --   border = 'double', -- none, single, double, shadow
    --   padding = { 1, 1, 1, 1 }, -- [top, right, bottom, left]
    --   winblend = 0,
    -- },
  },
  config = function()
    require('which-key').register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    }
  end,
}
