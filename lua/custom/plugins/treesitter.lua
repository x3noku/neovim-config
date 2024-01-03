return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-context' },
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'css',
        'dockerfile',
        'gitignore',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'regex',
        'scss',
        'sql',
        'tsx',
        'typescript',
        'vimdoc',
        'vim',
        'yaml',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }

    require('treesitter-context').setup {
      max_lines = 3, -- Values <= 0 mean no limit.
      line_numbers = true,
      trim_scope = 'outer',
      mode = 'cursor', -- Choices: 'cursor', 'topline'
      zindex = 20,
    }
  end,
  build = ':TSUpdate',
}
