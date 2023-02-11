return {
    enable_git_status = true,
    popup_border_style = 'rounded',
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
        },
    },
    default_component_configs = {
        modified = {
          symbol = '●',
          highlight = "NeoTreeModified",
        },
        git_status = {
            symbols = {
                added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                deleted   = "✖",-- this can only be used in the git_status source
                renamed   = "",-- this can only be used in the git_status source
                untracked = "",
                ignored   = "",
                unstaged  = "✘",
                staged    = "✔",
                conflict  = "",
                conflict  = "〆",
            },
        },
    },
    window = { width = 39 },
}
