return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-context' },
    { 'windwp/nvim-ts-autotag', event = 'InsertEnter', opts = {} },
    { 'davidmh/mdx.nvim', config = true },
  },
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'bash',
        'c',
        'css',
        'diff',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'json5',
        'lua',
        'luadoc',
        'luap',
        'markdown',
        'markdown_inline',
        'prisma',
        'python',
        'regex',
        'scss',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
      },
      -- auto_install = true,
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

    vim.filetype.add {
      pattern = {
        ['.*/kitty/.+%.conf'] = 'kitty',
        ['%.env%.[%w_.-]+'] = 'sh',
      },
    }
    vim.treesitter.language.register('bash', 'kitty')
  end,
}
