return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = true,
    keywords = {
      TODO = { icon = ' ', alt = { 'ToDo', 'todo' } },
      FIXME = { icon = ' ', alt = { 'FixMe', 'fixme' } },
      HACK = { icon = ' ', alt = { 'Hack', 'hack' } },
      WARN = { icon = ' ', alt = { 'WARNING', 'Warning', 'warning', 'Warn', 'warn' } },
      PERF = {
        icon = ' ',
        alt = { 'PERFORMANCE', 'OPTIMIZE', 'Perfomance', 'Optimize', 'Perf', 'perfomance', 'optimize', 'perf' },
      },
      NOTE = { icon = ' ', alt = { 'INFO', 'Note', 'Info', 'note', 'info' } },
    },
    highlight = {
      multiline = false,
      before = 'fg',
      keyword = 'wide_bg',
      after = 'bg',
      comments_only = true,
      pattern = [[(KEYWORDS)(\:|\(.*\)\:?)\s*]],
    },
    search = {
      pattern = [[\b(KEYWORDS)]], -- ripgrep regex
    },
    gui_style = {
      bg = 'BOLD',
    },
  },
}
