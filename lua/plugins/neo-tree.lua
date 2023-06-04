return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        opts = {
            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
                follow_current_file = false,
                use_libuv_file_watcher = true,
            },
        },
    },
}
