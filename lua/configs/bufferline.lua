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
                    table.insert(result, { text = '|              Nvim Tree               |' })
                end

                return result
            end,
        },
    },
}