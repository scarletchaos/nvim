require("telescope").load_extension("git_worktree")
local builtin = require('telescope.builtin')
local worktree = require('telescope').extensions.git_worktree
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "fuzzy-find project files" })
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function ()
	builtin.grep_string()
end, { desc = "grep string" })
vim.keymap.set('n', '<leader>lf', function ()
	builtin.live_grep()
end, { desc = "grep project files" })

vim.keymap.set('n', '<leader>wtl', function ()
    worktree.git_worktrees()
    -- <Enter> - switches to that worktree
    -- <c-d> - deletes that worktree
    -- <c-f> - toggles forcing of the next deletion
end, { desc = "list worktrees" })

vim.keymap.set('n', '<leader>wtc', function ()
    worktree.create_git_worktree()
end, { desc = "create worktree" })
