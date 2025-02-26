return {
  'folke/which-key.nvim',
  config = function()
    local wk = require 'which-key'

    wk.setup {
      win = {
        -- disable popup scrolling popup when it overlaps with cursor
        no_overlap = false,
      },
    }

    wk.add {
      { '<leader>c', desc = '[C]ode' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>g', group = '[G]it' },
      { '<leader>h', group = '[H]unks' },
      { '<leader>f', desc = '[F]ind' },
      { '<leader>u', group = '[U]I' },
      { '<leader>t', group = '[T]erminal' },
    }
  end,
}
