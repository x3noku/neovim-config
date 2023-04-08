return {
    signs = true,
    keywords = {
        TODO = { icon = ' ', alt = { 'ToDo', 'todo' } },
        FIXME = { icon = ' ', alt = { 'FixMe', 'fixme' } },
        HACK = { icon = ' ', alt = { 'Hack', 'hack' } },
        WARN = { icon = ' ', alt = { 'WARNING', 'Warning', 'warning', 'Warn', 'warn' } },
        PERF = { icon = ' ', alt = { 'PERFORMANCE', 'OPTIMIZE', 'Perfomance', 'Optimize', 'Perf', 'perfomance', 'optimize', 'perf' } },
        NOTE = { icon = ' ', alt = { 'INFO', 'Note', 'Info', 'note', 'info' } },
    },
    highlight = {
        multiline = false,
        before = 'bg',
        keyword = 'wide_bg',
        after = 'bg',
        comments_only = true,
    },
    gui_style = {
        bg = 'BOLD',
    },
}
