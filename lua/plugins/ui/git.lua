return {
  {
    'kdheepak/lazygit.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'dinhhuy258/git.nvim',
    event = 'VeryLazy',
    config = function()
      require('git').setup {
        default_mappings = false,
        target_branch = 'main',
      }

      vim.keymap.set('n', '<leader>go', "<cmd>lua require('git.browse').open(false)<cr>", {
        desc = '[G]it [O]pen',
        noremap = true,
        silent = true,
        expr = false,
      })
      vim.keymap.set('x', '<leader>go', ":<C-u> lua require('git.browse').open(true)<cr>", {
        desc = '[G]it [O]pen',
        noremap = true,
        silent = true,
        expr = false,
      })
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = {
      signs = {
        add = { text = ' ▎' },
        change = { text = ' ▎' },
        delete = { text = ' ' },
        topdelete = { text = ' ' },
        changedelete = { text = ' ▎' },
        untracked = { text = ' ▎' },
      },
      current_line_blame = true,
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      on_attach = function(bufnr)
        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        vim.keymap.set({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
      end,
    },
  },
}
