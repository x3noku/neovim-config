return {
  'folke/which-key.nvim',
  config = function()
    require('which-key').register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>h'] = { name = '[H]unks', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
      ['<leader>u'] = { name = '[U]I', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]erminal', _ = 'which_key_ignore' },
    }
  end,
}
