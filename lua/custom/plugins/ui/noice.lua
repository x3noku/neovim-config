return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },
    lsp = {
      hover = {
        silent = true,
      },
    },
    routes = {
      {
        filter = {
          event = 'msg_show',
          kind = '',
          find = 'written',
        },
        opts = { skip = true },
      },
    },
  },
  dependencies = {
    { 'MunifTanjim/nui.nvim' },
    {
      'rcarriga/nvim-notify',
      keys = {
        {
          '<leader>un',
          function()
            require('notify').dismiss { silent = true, pending = true }
          end,
          desc = 'Dismiss all Notifications',
        },
      },
    },
  },
}
