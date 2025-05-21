return {
  'CRAG666/betterTerm.nvim',
  commit = '5d3f41d9e8b3553d49764906a14e45a08dbe2308',
  config = function()
    require('betterTerm').setup {
      prefix = 'Term_',
      startInserted = true,
      position = 'bot',
      size = 18,
    }

    local betterTerm = require 'betterTerm'
    -- toggle firts term
    vim.keymap.set({ 'n', 't' }, '<C-/>', betterTerm.open, { desc = 'Open terminal' })
    -- Select term focus
    vim.keymap.set({ 'n' }, '<leader>tt', betterTerm.select, { desc = 'Select terminal' })
    -- Create new term
    local current = 2
    vim.keymap.set({ 'n' }, '<leader>tn', function()
      betterTerm.open(current)
      current = current + 1
    end, { desc = 'New terminal' })
  end,
}
