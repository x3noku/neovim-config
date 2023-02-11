api.nvim_create_autocmd(
    'TextYankPost',
    { command = 'silent! lua vim.highlight.on_yank()' }
)

-- todo: add autocmds for latex
-- api.nvim_create_autocmd(
--     { 'BufWritePost', 'FileType' },
--     { pattern = '*.tex', command = 'VimtexCompile' }
-- )
--
-- api.nvim_create_autocmd(
--     { 'BufRead', 'FileType' },
--     {
--         pattern = '*.tex',
--         callback = function ()
--             local filename = vim.fn.expand('%:p')
--             local is_empty = true
--
--             for _ in io.lines(filename) do
--                 is_empty = is_empty and false
--                 if is_empty then break end
--             end
--
--             if is_empty then
--                 cmd '0r ~/.config/nvim/skeletons/skeleton.tex'
--             end
--         end
--     }
-- )
