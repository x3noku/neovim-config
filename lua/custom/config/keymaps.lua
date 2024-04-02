vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('i', 'jj', '<esc>', { silent = true })
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

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Telescope keymaps
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', function()
  require('telescope.builtin').buffers { sort_lastused = true }
end, { desc = '[ ] Find existing buffers' })
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
vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = '[F]ind [T]odos' })
vim.keymap.set('n', '<leader>fc', '<cmd>noh<cr><esc>', { desc = '[F]ind [C]lear' })
vim.keymap.set('n', '<esc>', '<cmd>noh<cr><esc>', { desc = '[F]ind [C]lear' })

-- Buffers
-- vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
-- vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })

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
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Files', noremap = true })
vim.keymap.set('n', '<space>gg', '<cmd>LazyGit<cr>', { desc = 'LazyGit', noremap = true })

-- todo: add git hunks hotkeys

-- -- Floating terminal
-- local lazyterm = function() Util.terminal(nil, { cwd = Util.root() }) end
-- map("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<leader>fT", function() Util.terminal() end, { desc = "Terminal (cwd)" })
-- map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
--
-- -- Terminal Mappings
-- map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
-- map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
-- map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
-- map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
-- map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
-- map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
