return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    presets = {
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
}
