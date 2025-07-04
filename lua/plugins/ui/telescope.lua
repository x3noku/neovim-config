return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    -- {
    --   'nvim-telescope/telescope-fzf-native.nvim',
    --   -- NOTE: If you are having trouble with this installation,
    --   --       refer to the README for telescope-fzf-native for more instructions.
    --   build = 'make',
    --   cond = function()
    --     return vim.fn.executable 'make' == 1
    --   end,
    -- },
    {
      'nvim-telescope/telescope-live-grep-args.nvim',
      version = '^1.0.0',
      config = function()
        require('telescope').load_extension 'live_grep_args'
      end,
    },
    {
      'nvim-telescope/telescope-ui-select.nvim',
      config = function()
        require('telescope').setup {
          extensions = {
            ['ui-select'] = {
              require('telescope.themes').get_dropdown(),
            },
          },
        }

        require('telescope').load_extension 'ui-select'
      end,
    },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-j>'] = require('telescope.actions').move_selection_next,
            ['<C-k>'] = require('telescope.actions').move_selection_previous,
          },
        },
      },
      pickers = {
        find_files = {
          -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
          find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
        },
        buffers = {
          mappings = {
            i = {
              ['<C-d>'] = require('telescope.actions').delete_buffer,
            },
            n = {
              ['d'] = require('telescope.actions').delete_buffer,
            },
          },
        },
      },
    }
  end,
}
