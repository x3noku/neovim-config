-- color schemes
local function write_theme (id)
    -- todo: create folder if not
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
    -- info('Theme set to ' .. theme.name)
end

function warn(msg, name)
    notify(msg, vim.log.levels.WARN, { title = name })
end

function error(msg, name)
    notify(msg, vim.log.levels.ERROR, { title = name})
end

function info(msg, name)
    notify(msg, vim.log.levels.INFO, { title = name })
end
