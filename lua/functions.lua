-- color schemes
local function write_theme (id)
    local file = io.open(os.getenv('HOME') .. '/.config/nvim/config/theme', 'w')
    file:write(id)
    return file:close()
end;

function read_theme ()
    local file = io.open(os.getenv('HOME') .. '/.config/nvim/config/theme', 'r')
    if file then
        local id = file:read()
        file:close()
	if themes[id] ~= nil then
		return themes[id]
	end
    end

    return themes.vim_material_dark
end

function set_theme (theme)
    theme.command()
    write_theme(theme.id)
    info('Theme set to ' .. theme.name)
end

function random_theme (themes, amount)
    math.randomseed(os.time())
    local random = math.random(amount)

    local i = 1
    for _, theme in pairs(themes) do
        if i > amount then return end

        if i == random then
            return theme
        else
            i = i + 1
        end
    end
end


-- notifications
function warn(msg, opts)
    return notify(msg, vim.log.levels.WARN, opts)
end

function info(msg, opts)
    return notify(msg, vim.log.levels.INFO, opts)
end


-- neovide
scale_note= nil
function change_neovide_scale(amount)
    if g.neovide then
        local scale = g.neovide_scale_factor + amount
        g.neovide_scale_factor = scale
        scale_note = info(
            'Scale set to ' .. tostring(scale * 100) .. '%',
            { timeout = 200, replace = scale_note, on_close = function () scale_note = nil end }
        ).id
    end
end

function increase_neovide_scale()
    change_neovide_scale(0.1)
end

function decrease_neovide_scale()
    change_neovide_scale(-0.1)
end


