vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('i', 'jj', '<esc>', { silent = true })
vim.keymap.set('i', 'оо', '<esc>', { silent = true })
vim.keymap.set('n', '<C-q>', '<cmd>qa<cr>', { desc = 'Quit all' })
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- Navigation keymaps
vim.keymap.set({ 'n', 'x' }, 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Down>', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Up>', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })

vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Better move up' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Better move down' })
vim.keymap.set('n', 'N', 'Nzz', { desc = 'Search previous' })
vim.keymap.set('n', 'n', 'nzz', { desc = 'Search next' })

-- Move lines
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move line up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move line down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move lines Down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move lines Up' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

-- Telescope keymaps
vim.keymap.set('n', '<leader><space>', function()
  require('telescope.builtin').buffers { sort_lastused = true }
end, { desc = '[ ] Find existing buffers' })
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
-- vim.keymap.set('n', '<leader>/', function()
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown())
-- end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set(
  'n',
  '<leader>fg',
  require('telescope').extensions.live_grep_args.live_grep_args,
  { desc = '[F]ind by [G]rep' }
)
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = '[F]ind [R]esume' })
vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = '[F]ind [T]odos' })
vim.keymap.set('n', '<leader>fc', '<cmd>noh<cr><esc>', { desc = '[F]ind [C]lear' })
vim.keymap.set('n', '<esc>', '<cmd>noh<cr><esc>', { desc = '[F]ind [C]lear' })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
vim.keymap.set(
  'n',
  '<leader>ur',
  '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>',
  { desc = 'Redraw / Clear hlsearch / Diff Update' }
)

-- Clipboard
vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
vim.keymap.set('n', '<c-p>', '<Plug>(YankyPreviousEntry)')
vim.keymap.set('n', '<c-n>', '<Plug>(YankyNextEntry)')

vim.keymap.set({ 'n', 'x' }, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>yy', '"+yy')
vim.keymap.set({ 'n', 'x' }, '<leader>p', '"+p')
vim.keymap.set({ 'n', 'x' }, '<leader>P', '"+P')

-- Splits
vim.keymap.set('n', '<C-Left>', require('smart-splits').resize_left)
vim.keymap.set('n', '<C-Down>', require('smart-splits').resize_down)
vim.keymap.set('n', '<C-Up>', require('smart-splits').resize_up)
vim.keymap.set('n', '<C-Right>', require('smart-splits').resize_right)

vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)

-- Add undo break-points
vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', ';', ';<c-g>u')

-- Better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Managers
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })
vim.keymap.set('n', '<leader>m', '<cmd>Mason<cr>', { desc = 'Mason' })
vim.keymap.set({ 'n', 'v' }, '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Files', noremap = true })

-- Lazygit
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'LazyGit', noremap = true })
vim.keymap.set('n', '<leader>gf', '<cmd>LazyGitFilterCurrentFile<cr>', { desc = '[G]it [F]ile History' })
vim.keymap.set('n', '<leader>gd', require('gitsigns').diffthis, { desc = '[G]it [D]iff' })
vim.keymap.set('n', '<leader>gD', function()
  require('gitsigns').diffthis '~'
end, { desc = '[G]it [D]iff ~' })

-- Git hunks
vim.keymap.set('n', '<leader>hs', require('gitsigns').stage_hunk, { desc = '[H]unk [S]tage' })
vim.keymap.set('n', '<leader>hr', require('gitsigns').stage_hunk, { desc = '[H]unk [R]eset' })
vim.keymap.set('v', '<leader>hs', function()
  require('gitsigns').stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = '[H]unk [S]tage' })
vim.keymap.set('v', '<leader>hr', function()
  require('gitsigns').reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = '[H]unk [R]eset' })
vim.keymap.set('n', '<leader>hu', require('gitsigns').undo_stage_hunk, { desc = '[H]unk Stage [U]ndo' })
vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { desc = '[H]unk [P]review' })

vim.keymap.set('n', '<leader>hd', require('gitsigns').toggle_deleted, { desc = '[H]ighlight [D]eleted' })
vim.keymap.set('n', '<leader>hl', require('gitsigns').toggle_linehl, { desc = '[H]ighlight [L]ines' })
vim.keymap.set('n', '<leader>hw', require('gitsigns').toggle_word_diff, { desc = '[H]ighlight [W]ords' })
vim.keymap.set('n', '<leader>ha', function()
  require('gitsigns').toggle_deleted()
  require('gitsigns').toggle_linehl()
  require('gitsigns').toggle_word_diff()
end, { desc = '[H]ighlight [A]all' })

vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
