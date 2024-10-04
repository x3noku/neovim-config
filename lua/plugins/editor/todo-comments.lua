return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = true,
    keywords = {
      TODO = { icon = ' ', color = 'info', alt = { 'ToDo', 'todo' } },
      FIXME = {
        icon = ' ',
        color = 'error',
        alt = { 'FixMe', 'fixme', 'BUG', 'bug', 'FIXIT', 'FixIt', 'fixit', 'ISSUE', 'issue' },
      },
      HACK = { icon = ' ', color = 'warning', alt = { 'Hack', 'hack' } },
      WARN = {
        icon = ' ',
        color = 'warning',
        alt = { 'WARNING', 'Warning', 'warning', 'Warn', 'warn', 'XXX', 'xxx' },
      },
      PERF = {
        -- icon = ' ',
        icon = '⏲ ',
        alt = { 'PERFORMANCE', 'OPTIMIZE', 'Perfomance', 'Optimize', 'Perf', 'perfomance', 'optimize', 'perf' },
      },
      NOTE = { icon = ' ', alt = { 'INFO', 'HINT', 'Note', 'Info', 'Hint', 'note', 'info', 'hint' } },
      -- TEST = { icon = '', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
    },
    highlight = {
      multiline = false,
      before = 'fg',
      keyword = 'wide_bg',
      after = 'bg',
      comments_only = true,
      pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]],
    },
    search = {
      command = 'rg',
      args = {
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
      },
      -- regex that will be used to match keywords.
      -- don't replace the (KEYWORDS) placeholder
      pattern = [[\b(KEYWORDS)(\(\w*\))*:]],
    },
    gui_style = {
      bg = 'BOLD',
    },
  },
}
