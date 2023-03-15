themes = {}


-- light themes
themes.vim_material_light = {
    name = 'Vim Material Light',
    id = 'vim_material_light',
    mode = 'light',
    command = function ()
        opt.background = 'light'
        cmd [[colorscheme vim-material]]
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

themes.kangawa_lotus = {
    name = 'Kanagawa Lotus',
    id = 'kangawa_lotus',
    mode = 'light',
    command = function ()
        opt.background = 'light'
        cmd [[colorscheme kanagawa-lotus]]
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

themes.janah = {
    name = 'Janah',
    id = 'janah',
    mode = 'dark',
    command = function ()
        opt.background = 'dark'
        cmd [[colorscheme janah]]
    end
}

themes.eva01 = {
    name = 'Eva 01',
    id = 'eva01',
    mode = 'dark',
    command = function ()
        opt.background = 'dark'
        cmd [[colorscheme eva01]]
    end
}

themes.eva01lcl = {
    name = 'Eva 01 LCL',
    id = 'eva01lcl',
    mode = 'dark',
    command = function ()
        opt.background = 'dark'
        cmd [[colorscheme eva01-LCL]]
    end
}

themes.snazzy = {
    name = 'Snazzy',
    id = 'snazzy',
    mode = 'dark',
    command = function ()
        opt.background = 'dark'
        cmd [[colorscheme snazzy]]
    end
}
themes.kangawa_wave = {
    name = 'Kanagawa Wave',
    id = 'kangawa_wave',
    mode = 'dark',
    command = function ()
        opt.background = 'dark'
        cmd [[colorscheme kanagawa-wave]]
    end
}

themes.kangawa_dragon = {
    name = 'Kanagawa Dragon',
    id = 'kangawa_dragon',
    mode = 'dark',
    command = function ()
        opt.background = 'dark'
        cmd [[colorscheme kanagawa-dragon]]
    end
}


-- theme map
local binds = '123456789abcdefghijklmnopqrstuvwxyz'

thememap = {
	name = 'Themes',
}

local i = 1
local light_themes = {}
local dark_themes = {}
local amount_light = 0
local amount_dark = 0

thememap[binds:sub(i, i)] = { function () set_theme(random_theme(light_themes, amount_light)) end, 'LIGHT THEMES' }
i = i + 1

for _, theme in pairs(themes) do
	if theme.mode == 'light' then
		thememap[binds:sub(i, i)] = { function () set_theme(theme) end, theme.name }
        light_themes[amount_light] = theme

        amount_light = amount_light + 1
		i = i + 1
	end
end

while i % 4 ~= 1 do
	thememap[binds:sub(i, i)] = { function () end, '' }
	i = i + 1
end

thememap[binds:sub(i, i)] = { function () set_theme(random_theme(dark_themes, amount_dark)) end, 'DARK THEMES' }
i = i + 1

for _, theme in pairs(themes) do
	if theme.mode == 'dark' then
		thememap[binds:sub(i, i)] = { function () set_theme(theme) end, theme.name }
        dark_themes[amount_dark] = theme

        amount_dark = amount_dark + 1
		i = i + 1
	end
end

whichkey.register(thememap, { prefix = 't' })
