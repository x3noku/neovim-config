return {
  'folke/which-key.nvim',
  config = function()
    local wk = require 'which-key'

    wk.add {
      { '<leader>c', desc = '[C]ode' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>g', group = '[G]it' },
      { '<leader>h', group = '[H]unks' },
      { '<leader>f', desc = '[F]ind' },
      { '<leader>u', group = '[U]I' },
      { '<leader>t', group = '[T]erminal' },
    }

    --[[ require('which-key').register {
      { '', group = '[C]ode' },
      -- ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      { '', group = '[D]ocument' },
      -- ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      { '', group = '[G]it' },
      -- ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      { '', group = '[H]unks' },
      -- ['<leader>h'] = { name = '[H]unks', _ = 'which_key_ignore' },
      { '', group = '[F]ind' },
      -- ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
      { '', group = '[U]I' },
      -- ['<leader>u'] = { name = '[U]I', _ = 'which_key_ignore' },
      { '', group = '[T]erminal' },
      -- ['<leader>t'] = { name = '[T]erminal', _ = 'which_key_ignore' },
    } ]]
  end,
}
