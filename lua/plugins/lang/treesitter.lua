return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-context' },
    { 'windwp/nvim-ts-autotag' },
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'css',
        'lua',
        'scss',
        'tsx',
        'typescript',
        'prisma',
      },
      -- auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = {
        enable = true,
      },
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
