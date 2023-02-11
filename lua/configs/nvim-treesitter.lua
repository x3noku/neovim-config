return {
    ensure_installed = { 'bash', 'c', 'cpp', 'css', 'dart', 'dockerfile', 'gitignore', 'go', 'html', 'java', 'javascript', 'json', 'julia', 'kotlin', 'latex', 'lua', 'markdown', 'prisma', 'python', 'regex', 'rust', 'scss', 'solidity', 'sql', 'swift', 'tsx', 'typescript' },
    sync_install = false,
    auto_install = true,
    ignore_install = { },
    highlight = {
        enable = true,
        disable = { }, -- NOTE: these are the names of the parsers and not the filetype.
        disable = function(lang, buf)
            local max_filesize = 1024 * 1024 -- 1 MB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },
    context_commentstring = {
        enable = true
    },
    autotag = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = false, -- Also highlight non-bracket delimiters like html tags 
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        colors = { '#42CAFD', '#EF626C', '#48AD7E', '#429E73', '#8A4277' }
    },
}
