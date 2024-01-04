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
      'nvim-telescope/telescope-file-browser.nvim',
      dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
      config = function()
        require('telescope').load_extension 'file_browser'
      end,
    },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        file_browser = {
          theme = 'ivy',
          grouped = true,
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ['i'] = {
              -- your custom insert mode mappings
            },
            ['n'] = {
              -- your custom normal mode mappings
            },
          },
        },
      },
    }
  end,
}
