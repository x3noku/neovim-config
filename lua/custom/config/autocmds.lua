local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.defer_fn(function()
  -- todo: set theme
  -- local themes = require 'config.themes'
  -- themes.set(themes.read())
end, 0)
