require("oil").setup({
    delete_to_trash = true,
    default_file_explorer = false,
    columns = {
        "icon",
        "size",
    },
    view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
    }
    -- Configuration here, or leave empty to use defaults
})
