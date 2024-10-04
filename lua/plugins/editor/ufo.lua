return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      { 'kevinhwang91/promise-async' },
      {
        'luukvbaal/statuscol.nvim',
        config = function()
          local builtin = require 'statuscol.builtin'

          require('statuscol').setup {
            relculright = false, -- whether to right-align the cursor line number with 'relativenumber' set
            segments = {
              { text = { builtin.foldfunc },      click = 'v:lua.ScFa' },
              { text = { '%s' },                  click = 'v:lua.ScSa' },
              { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
            },
          }
        end,
      },
    },
    config = function()
      require('ufo').setup {
        provider_selector = function()
          return { 'treesitter', 'indent' }
        end,
      }
    end,
  },
}
