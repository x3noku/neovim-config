return {
  'mcauley-penney/visual-whitespace.nvim',
  opts = {
    highlight = { link = 'Visual' },
    space_char = '·',
    tab_char = '→',
    nl_char = '↲',
    cr_char = '←',
    enabled = true,
    excluded = {
      filetypes = {},
      buftypes = {},
    },
  },
  config = function(opts)
    local highlight = vim.api.nvim_get_hl(0, { name = 'Visual' })
    local bg = not vim.tbl_isempty(highlight) and highlight.bg or nil

    vim.api.nvim_set_hl(0, 'VisualNonText', { fg = '#808080', bg = bg })

    require('visual-whitespace').setup(opts)
  end,
}
