local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        if opts.remap and not vim.g.vscode then
            opts.remap = nil
        end
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

map("i", "jj", "<ESC>", { silent = true })
map("n", "fc", ":noh<CR><ESC>", { desc = "Escape and clear hlsearch" })
map("n", "<C-q>", ":qa<CR>", { desc = "Quit all" })

map("n", "<C-u>", "<C-u>zz", { desc = "Better move up" })
map("n", "<C-d>", "<C-d>zz", { desc = "Better move down" })
map("n", "N", "Nzz", { desc = "Search previous" })
map("n", "n", "nzz", { desc = "Search next" })

map("n", "{", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })
map("n", "}", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })

map("n", "<leader>qr", ":Reload<CR>", { desc = "Reload nvim" })

map("v", "<leader>p", [["0p]], { desc = "Paste without yanking" })

-- fixme: find out keys to save previous <A-j>, <A-k> behaviour
map("n", "<A-h>", require("smart-splits").resize_left)
map("n", "<A-j>", require("smart-splits").resize_down)
map("n", "<A-k>", require("smart-splits").resize_up)
map("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
map("n", "<C-h>", require("smart-splits").move_cursor_left)
map("n", "<C-j>", require("smart-splits").move_cursor_down)
map("n", "<C-k>", require("smart-splits").move_cursor_up)
map("n", "<C-l>", require("smart-splits").move_cursor_right)
-- swapping buffers between windows
map("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
map("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
map("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
map("n", "<leader><leader>l", require("smart-splits").swap_buf_right)
