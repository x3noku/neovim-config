return {
    {
        "echasnovski/mini.bufremove",
        keys = {
            {
                "<S-b>",
                function()
                    require("mini.bufremove").delete(0, false)
                end,
                desc = "Delete Buffer",
            },
        },
    },
}
