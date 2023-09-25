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

map("n", "{", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })
map("n", "}", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })
