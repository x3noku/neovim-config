return {}

-- return {
--   'nvim-telescope/telescope-file-browser.nvim',
--   dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
--   config = function()
--     require('telescope').setup {
--       extensions = {
--         file_browser = {
--           theme = 'ivy',
--           grouped = true,
--           hijack_netrw = true,
--           mappings = {
--             ['i'] = {
--               -- your custom insert mode mappings
--             },
--             ['n'] = {
--               -- your custom normal mode mappings
--             },
--           },
--         },
--       },
--     }
--
--     require('telescope').load_extension 'file_browser'
--   end,
-- }
