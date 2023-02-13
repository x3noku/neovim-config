return {
    input = {
        enabled = true,
        default_prompt = 'Input:',
        prompt_align = 'left',
        insert_only = true,
        start_in_insert = true,
        anchor = 'SW',
        border = 'rounded',
        relative = 'cursor',
        prefer_width = 40,
        width = nil,
        max_width = { 140, 0.9 },
        min_width = { 20, 0.2 },
        buf_options = {},
        win_options = {
            winblend = 0,
            wrap = false,
        },
    },
    select = {
        enabled = true,
        backend = { 'telescope', 'fzf_lua', 'fzf', 'builtin', 'nui' },
        trim_prompt = true,
        telescope = nil,
        fzf = {
            window = {
                width = 0.5,
                height = 0.4,
            },
        },
        fzf_lua = {
            winopts = {
                width = 0.5,
                height = 0.4,
            },
        },
        nui = {
            position = '50%',
            size = nil,
            relative = 'editor',
            border = {
                style = 'rounded',
            },
            buf_options = {
                swapfile = false,
                filetype = 'DressingSelect',
            },
            win_options = {
                winblend = 10,
            },
            max_width = 80,
            max_height = 40,
            min_width = 40,
            min_height = 10,
        },
        builtin = {
            anchor = 'SW',
            border = 'rounded',
            relative = 'editor',
            buf_options = {},
            win_options = {
                winblend = 0,
            },
            width = nil,
            max_width = { 140, 0.8 },
            min_width = { 40, 0.2 },
            height = nil,
            max_height = 0.9,
            min_height = { 10, 0.2 },
            mappings = {
                ['<Esc>'] = 'Close',
                ['<CR>'] = 'Confirm',
            },
        },
    },
}
