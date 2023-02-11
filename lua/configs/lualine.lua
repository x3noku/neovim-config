local navic = require('nvim-navic')

return {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { --[[ 'filename', ]] { navic.get_location, cond = navic.is_available } },
        lualine_x = { --[[ 'encoding', 'fileformat', ]] 'filetype' },
        lualine_y = { 'progress', 'location' },
        lualine_z = { 'os.date("%H:%M:%S")', 'os.date("%d.%m.%y")' },
    },
}
