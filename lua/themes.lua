themes = {}


-- light themes
themes.everforest_light = {
    name = 'Everforest Light',
    id = 'everforest_light',
    mode = 'light',
    command = function ()
        opt.background = 'light'
        g.everforest_background = 'medium'        -- hard, medium, soft
        g.everforest_better_performance = 1
        cmd [[colorscheme everforest]]
    end
}

themes.vim_material_light = {
    name = 'Vim Material Light',
    id = 'vim_material_light',
    mode = 'light',
    command = function ()
        opt.background = 'light'
        cmd [[colorscheme vim-material]]
    end
}

themes.sobrio_light = {
    name = 'Sobrio Light',
    id = 'sobrio_light',
    mode = 'light',
    command = function ()
        opt.background = 'light'
        cmd [[colorscheme sobrio_light]]
    end
}

themes.catppuccin_latte = {
    name = 'Catppuccin Latte',
    id = 'catppuccin_latte',
    mode = 'light',
    command = function ()
        opt.background = 'light'
        cmd [[colorscheme catppuccin-latte]]
    end
}


-- dark themes
themes.vim_material_dark = {
    name = 'Vim Material Dark',
    id = 'vim_material_dark',
    mode = 'dark',
    command = function ()
        opt.background = 'dark'
        cmd [[colorscheme vim-material]]
    end
}

themes.sobrio_dark = {
    name = 'Sobrio Dark',
    id = 'sobrio_dark',
    mode = 'dark',
    command = function ()
        opt.background = 'dark'
        cmd [[colorscheme sobrio]]
    end
}

themes.sobrio_verde_dark = {
    name = 'Sobrio Verde Dark',
    id = 'sobrio_verde_dark',
    mode = 'dark',
    command = function ()
        opt.background = 'dark'
        cmd [[colorscheme sobrio_verde]]
    end
}

themes.sonokai_andromeda = {
	name = 'Sonokai Andromeda',
	id = 'sonokai_andromeda',
	mode = 'dark',
	command = function ()
		opt.background = 'dark'
		g.sonokai_style = 'andromeda'				  -- default, atlantis, andromeda, shusia, maia, espresso
		g.sonokai_better_performance = 1
		cmd [[colorscheme sonokai]]
	end
}

themes.sonokai_shusia = {
	name = 'Sonokai Shusia',
	id = 'sonokai_shusia',
	mode = 'dark',
	command = function ()
		opt.background = 'dark'
		g.sonokai_style = 'shusia'				  -- default, atlantis, andromeda, shusia, maia, espresso
		g.sonokai_better_performance = 1
		cmd [[colorscheme sonokai]]
	end
}

themes.cyberpunk = {
    name = 'Cyberpunk',
    id = 'cyberpunk',
    mode = 'dark',
    command = function ()
        opt.background = 'dark'
        g.cyberpunk_cursorline = 'black'
        cmd [[colorscheme cyberpunk]]
    end
}

themes.catppuccin_mocha = {
    name = 'Catppuccin Mocha',
    id = 'catppuccin_mocha',
    mode = 'dark',
    command = function ()
        opt.background = 'dark'
        cmd [[colorscheme catppuccin-mocha]]
    end
}



-- theme map
local binds = '123456789abcdefghijklmnopqrstuvwxyz'

thememap = {
	name = 'Themes',
}

local i = 1

thememap[binds:sub(i, i)] = { function () end, 'LIGHT THEMES' }
i = i + 1

for _, theme in pairs(themes) do
	if theme.mode == 'light' then
		thememap[binds:sub(i, i)] = { function () set_theme(theme) end, theme.name }
		i = i + 1
	end
end

while i % 4 ~= 1 do
	thememap[binds:sub(i, i)] = { function () end, '' }
	i = i + 1
end

thememap[binds:sub(i, i)] = { function () end, 'DARK THEMES' }
i = i + 1

for _, theme in pairs(themes) do
	if theme.mode == 'dark' then
		thememap[binds:sub(i, i)] = { function () set_theme(theme) end, theme.name }
		i = i + 1
	end
end

whichkey.register(thememap, { prefix = 't' })
