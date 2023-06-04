return {
    {
        "echasnovski/mini.hipatterns",
        event = "BufReadPre",
        opts = function()
            local hi = require("mini.hipatterns")
            return {
                tailwind = {
                    enabled = true,
                    ft = { "typescriptreact", "javascriptreact", "css", "javascript", "typescript", "html" },
                    style = "compact",
                },
                highlighters = {
                    hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),
                },
            }
        end,
        config = function(_, opts)
            if opts.tailwind == true then
                opts.tailwind = {
                    enabled = true,
                    ft = { "typescriptreact", "javascriptreact", "css", "javascript", "typescript", "html" },
                    style = "full",
                }
            end
            if type(opts.tailwind) == "table" and opts.tailwind.enabled then
                vim.api.nvim_create_autocmd("ColorScheme", {
                    callback = function()
                        ---@diagnostic disable-next-line: undefined-global
                        M.hl = {}
                    end,
                })
                opts.highlighters.tailwind = {
                    pattern = function()
                        if not vim.tbl_contains(opts.tailwind.ft, vim.bo.filetype) then
                            return
                        end
                        if opts.tailwind.style == "full" then
                            return "%f[%w:-]()[%w:-]+%-[a-z%-]+%-%d+()%f[^%w:-]"
                        elseif opts.tailwind.style == "compact" then
                            return "%f[%w:-][%w:-]+%-()[a-z%-]+%-%d+()%f[^%w:-]"
                        end
                    end,
                    priority = 2000,
                }
            end
            require("mini.hipatterns").setup(opts)
        end,
    },
}
