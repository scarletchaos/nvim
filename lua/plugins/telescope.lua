require("telescope").load_extension("git_worktree")
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("fzf")

local telescope = require("telescope")
local builtin = require('telescope.builtin')
local worktree = require('telescope').extensions.git_worktree

-- local gitignore = vim.fn.getcwd() .. "/.gitignore.telescope"


-- if vim.fn.filereadable(gitignore) == 0 then
--     gitignore = vim.fn.getcwd() .. '.gitignore'
-- end

-- telescope.setup({
--     defaults = {
--         find_command = { "rg", "--files", "--hidden", "--ignore-file", gitignore },
--     },
-- })

local keymap = vim.keymap.set


keymap("n", "<leader>pv", vim.cmd.Ex)
keymap('n', '<leader>pf', builtin.find_files, { desc = "fuzzy-find project files" })
keymap('n', '<C-p>', builtin.git_files, {})
keymap('n', '<leader>ps', function ()
    builtin.grep_string()
end, { desc = "grep string" })
keymap('n', '<leader>lf', function ()
    builtin.live_grep()
end, { desc = "grep project files" })

keymap('n', '<leader>wtl', function ()
    worktree.git_worktrees()
    -- <Enter> - switches to that worktree
    -- <c-d> - deletes that worktree
    -- <c-f> - toggles forcing of the next deletion
end, { desc = "list worktrees" })

keymap('n', '<leader>wtc', function ()
    worktree.create_git_worktree()
end, { desc = "create worktree" })
