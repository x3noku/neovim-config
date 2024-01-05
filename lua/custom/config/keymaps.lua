vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('i', 'jj', '<ESC>', { silent = true })
vim.keymap.set('n', '<C-q>', ':qa<CR>', { desc = 'Quit all' })

-- Navigation keymaps
vim.keymap.set('n', 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
vim.keymap.set('n', 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Better move up' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Better move down' })
vim.keymap.set('n', 'N', 'Nzz', { desc = 'Search previous' })
vim.keymap.set('n', 'n', 'nzz', { desc = 'Search next' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Telescope keymaps
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
-- vim.keymap.set('n', '<leader>/', function()
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown())
-- end, { desc = '[/] Fuzzily search in current buffer' })
-- vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope').extensions.live_grep_args.live_grep_args, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = '[F]ind [R]esume' })
vim.keymap.set('n', '<leader>fc', ':noh<CR>', { desc = '[F]ind [C]lear' })

-- File browser
vim.keymap.set('n', '<leader>b', ':Neotree<CR>', { noremap = true })

-- Lazygit
vim.keymap.set('n', '<space>gg', ':LazyGit<CR>', { noremap = true })

-- Clipboard
vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
vim.keymap.set('n', '<c-p>', '<Plug>(YankyPreviousEntry)')
vim.keymap.set('n', '<c-n>', '<Plug>(YankyNextEntry)')

vim.keymap.set({ 'n', 'x' }, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>yy', '"+yy')
vim.keymap.set({ 'n', 'x' }, '<leader>p', '"+p')
vim.keymap.set({ 'n', 'x' }, '<leader>P', '"+P')

-- map("n", "<A-h>", require("smart-splits").resize_left)
-- map("n", "<A-j>", require("smart-splits").resize_down)
-- map("n", "<A-k>", require("smart-splits").resize_up)
-- map("n", "<A-l>", require("smart-splits").resize_right)
-- -- moving between splits
-- map("n", "<C-h>", require("smart-splits").move_cursor_left)
-- map("n", "<C-j>", require("smart-splits").move_cursor_down)
-- map("n", "<C-k>", require("smart-splits").move_cursor_up)
-- map("n", "<C-l>", require("smart-splits").move_cursor_right)
-- -- swapping buffers between windows
-- map("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
-- map("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
-- map("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
-- map("n", "<leader><leader>l", require("smart-splits").swap_buf_right)
