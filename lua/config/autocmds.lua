local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
    group = augroup("change_theme"),
    callback = function()
        local themes = require("config.themes")
        themes.set(themes.read())
    end,
})
