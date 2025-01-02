require('hlchunk').setup({
    chunk = {
        enable = true,
        use_treesitter = true,
        chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
        },
        delay = 0,
        duration = 0
    },
    indent = {
        enable = false
        -- ...
    },
    blank = {
        enable = true,
        chars = { "." }
    }
})
