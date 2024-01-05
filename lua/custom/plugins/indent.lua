return {
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'InsertEnter',
    main = 'ibl',
    opts = {
      scope = { enabled = false },
    },
  },
  {
    'echasnovski/mini.indentscope',
    event = { 'BufReadPost', 'BufNewFile' },
    version = '*',
    config = function()
      require('mini.indentscope').setup {
        symbol = '│',
      }
    end,
  },
}
