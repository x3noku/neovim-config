---@diagnostic disable: assign-type-mismatch

local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

local M = {}
local themes = {}
local thememap = { name = "themes" }

local function write_theme(id)
    local file = io.open(os.getenv("HOME") .. "/.config/nvim/.theme", "w")
    if file ~= nil then
        file:write(id)
        file:close()
    end
end

local function random_theme(subthemes)
    math.randomseed(os.time())
    local random = math.random(#subthemes)

    local i = 1
    for _, theme in pairs(subthemes) do
        if i > #subthemes then
            return
        end

        if i == random then
            return theme
        else
            i = i + 1
        end
    end
end

function M.read()
    local file = io.open(os.getenv("HOME") .. "/.config/nvim/.theme", "r")
    if file then
        local id = file:read()
        file:close()

        for _, theme in pairs(themes) do
            if theme.id == id then
                return theme
            end
        end
    end

    return themes[#themes]
end

function M.set(theme)
    theme.command()
    write_theme(theme.id)
    vim.notify("Theme set to " .. theme.name)
end

-- light themes
themes[#themes + 1] = {
    name = "Catppuccin Latte",
    id = "catppuccin_latte",
    mode = "light",
    command = function()
        opt.background = "light"
        cmd([[colorscheme catppuccin-latte]])
    end,
}

themes[#themes + 1] = {
    name = "Rose Pine Dawn",
    id = "rose_pine_dawn",
    mode = "light",
    command = function()
        opt.background = "light"
        cmd([[colorscheme rose-pine]])
    end,
}

themes[#themes + 1] = {
    name = "Solarized8 Flat",
    id = "solarized8_flat",
    mode = "light",
    command = function()
        opt.background = "light"
        cmd([[colorscheme solarized8_flat]])
    end,
}

-- dark themes
themes[#themes + 1] = {
    name = "Sonokai Andromeda",
    id = "sonokai_andromeda",
    mode = "dark",
    command = function()
        opt.background = "dark"
        g.sonokai_style = "andromeda" -- default, atlantis, andromeda, shusia, maia, espresso
        g.sonokai_better_performance = 1
        cmd([[colorscheme sonokai]])
    end,
}

themes[#themes + 1] = {
    name = "Sonokai Shusia",
    id = "sonokai_shusia",
    mode = "dark",
    command = function()
        opt.background = "dark"
        g.sonokai_style = "shusia" -- default, atlantis, andromeda, shusia, maia, espresso
        g.sonokai_better_performance = 1
        cmd([[colorscheme sonokai]])
    end,
}

themes[#themes + 1] = {
    name = "Cyberpunk",
    id = "cyberpunk",
    mode = "dark",
    command = function()
        opt.background = "dark"
        g.cyberpunk_cursorline = "black"
        cmd([[colorscheme cyberpunk]])
    end,
}

themes[#themes + 1] = {
    name = "Catppuccin Mocha",
    id = "catppuccin_mocha",
    mode = "dark",
    command = function()
        opt.background = "dark"
        cmd([[colorscheme catppuccin-mocha]])
    end,
}

themes[#themes + 1] = {
    name = "Catppuccin Frappe",
    id = "catppuccin_frappe",
    mode = "dark",
    command = function()
        opt.background = "dark"
        cmd([[colorscheme catppuccin-frappe]])
    end,
}

themes[#themes + 1] = {
    name = "Eva 01",
    id = "eva01",
    mode = "dark",
    command = function()
        opt.background = "dark"
        cmd([[colorscheme eva01]])
    end,
}

themes[#themes + 1] = {
    name = "Eva 01 LCL",
    id = "eva01lcl",
    mode = "dark",
    command = function()
        opt.background = "dark"
        cmd([[colorscheme eva01-LCL]])
    end,
}

themes[#themes + 1] = {
    name = "Kanagawa Wave",
    id = "kangawa_wave",
    mode = "dark",
    command = function()
        opt.background = "dark"
        cmd([[colorscheme kanagawa-wave]])
    end,
}

themes[#themes + 1] = {
    name = "Kanagawa Dragon",
    id = "kangawa_dragon",
    mode = "dark",
    command = function()
        opt.background = "dark"
        cmd([[colorscheme kanagawa-dragon]])
    end,
}

themes[#themes + 1] = {
    name = "Horizon",
    id = "horizon",
    mode = "dark",
    command = function()
        opt.background = "dark"
        cmd([[colorscheme horizon]])
    end,
}

themes[#themes + 1] = {
    name = "Rose Pine",
    id = "rose_pine",
    mode = "dark",
    command = function()
        opt.background = "dark"
        cmd([[colorscheme rose-pine]])
    end,
}

themes[#themes + 1] = {
    name = "Embark",
    id = "embark",
    mode = "dark",
    command = function()
        opt.background = "dark"
        cmd([[colorscheme embark]])
    end,
}

themes[#themes + 1] = {
    name = "Fiesta",
    id = "no-clown-fiesta",
    mode = "dark",
    command = function()
        opt.background = "dark"
        cmd([[colorscheme no-clown-fiesta]])
    end,
}

themes[#themes + 1] = {
    name = "Oh My Monokai",
    id = "oh-my-monokai",
    mode = "dark",
    command = function()
        opt.background = "dark"
        cmd([[colorscheme oh-my-monokai]])
    end,
}

local binds = "123456789abcdefghijklmnopqrstuvwxyz"
local i = 1
local light_themes = {}
local dark_themes = {}

thememap[binds:sub(i, i)] = {
    function()
        M.set(random_theme(light_themes))
    end,
    "LIGHT THEMES",
}
i = i + 1

for _, theme in pairs(themes) do
    if theme.mode == "light" then
        thememap[binds:sub(i, i)] = {
            function()
                M.set(theme)
            end,
            theme.name,
        }
        light_themes[#light_themes + 1] = theme

        i = i + 1
    end
end

while i % 4 ~= 1 do
    thememap[binds:sub(i, i)] = { function() end, "" }
    i = i + 1
end

thememap[binds:sub(i, i)] = {
    function()
        M.set(random_theme(dark_themes))
    end,
    "DARK THEMES",
}
i = i + 1

for _, theme in pairs(themes) do
    if theme.mode == "dark" then
        thememap[binds:sub(i, i)] = {
            function()
                M.set(theme)
            end,
            theme.name,
        }
        dark_themes[#dark_themes + 1] = theme

        i = i + 1
    end
end

require("which-key").register(thememap, { prefix = "<leader>t" })

return M
