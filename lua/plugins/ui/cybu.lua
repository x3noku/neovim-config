return {
  'ghillb/cybu.nvim',
  branch = 'main',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('cybu').setup {
      position = {
        relative_to = 'editor',
        anchor = 'center',
        max_win_height = 15,
      },
      style = {
        path = 'relative',
        path_abbreviation = 'none',
        border = 'rounded',
        separator = ' ',
        prefix = '…',
        padding = 1,
        hide_buffer_id = false,
        devicons = {
          enabled = true,
          colored = true,
          truncate = true,
        },
        highlights = {
          current_buffer = 'Tag',
        },
      },
      behavior = {
        mode = {
          default = {
            switch = 'immediate', -- immediate, on_close
            view = 'paging',      -- paging, rolling
          },
          last_used = {
            switch = 'immediate', -- immediate, on_close
            view = 'paging',      -- paging, rolling
          },
        },
        show_on_autocmd = false,
      },
    }

    vim.keymap.set('n', 'H', '<plug>(CybuLastusedPrev)')
    vim.keymap.set('n', 'L', '<plug>(CybuLastusedNext)')
  end,
}
