return {
    options = {
        mode = 'buffers',
        icons = true,   -- true, 'numbers', 'both'
        buffer_close_icon = '✖',
        close_icon = '✖',
        modified_icon = '●',
        icon_pinned = '🖈',
        closable = true,
        truncate_names = true,
        -- diagnostics = 'coc',
        -- diagnostics_indicator = diagnostics_indicator,
	    groups = {
            items = {
	            require('bufferline.groups').builtin.pinned:with({ icon = '🖈' }),
	        },
	    },
        custom_areas = {
            left = function ()
                local result = {}

                local tree_open = false
                for key, id in pairs(api.nvim_list_bufs()) do
                    tree_open = tree_open or api.nvim_buf_get_option(id, 'filetype') == 'neo-tree'
                end

                if tree_open then
                    local absoulute = fn.expand('%:p')
                    local relative = string.gsub('/' .. fn.expand('%:.'), '%A', '.')

                    local name = string.gsub(absoulute, relative, '')
                    local path = string.match(name, '.+/')
                    if path ~= nil then
                        name = string.gsub(name, path, '')
                    else
                        name = ''
                    end

                    local fill = 40 - #name
                    local fill_left = math.floor(fill / 2)
                    local fill_right = fill - fill_left

                    for i = 1, fill_left - 1 do
                        name = ' ' .. name
                    end
                    name = '|' .. name

                    for i = 1, fill_right - 1 do
                        name = name .. ' '
                    end
                    name = name .. '|'

                    table.insert(result, { text = name })
                end

                return result
            end,
        },
    },
}
