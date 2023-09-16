return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            autotag = {
                enable = true,
            },
            rainbow = {
                enable = true,
                extended_mode = false, -- Also highlight non-bracket delimiters like html tags
                max_file_lines = nil, -- Do not enable for files with more than n lines, int
                colors = { "#42CAFD", "#EF626C", "#48AD7E", "#429E73", "#8A4277" },
            },
        },
    },
    { "windwp/nvim-ts-autotag" },
    { "p00f/nvim-ts-rainbow" },
}
