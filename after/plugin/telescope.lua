require("telescope").load_extension("git_worktree")
require("telescope").load_extension("live_grep_args")
local builtin = require("telescope.builtin")
local worktree = require("telescope").extensions.git_worktree
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "fuzzy-find project files" })
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", builtin.grep_string, { desc = "grep string" })
vim.keymap.set("n", "<leader>lf", builtin.live_grep, { desc = "grep project files" })

vim.keymap.set("n", "<leader>wtl", function()
	worktree.git_worktrees()
	-- <Enter> - switches to that worktree
	-- <c-d> - deletes that worktree
	-- <c-f> - toggles forcing of the next deletion
end, { desc = "list worktrees" })

vim.keymap.set("n", "<leader>wtc", worktree.create_git_worktree, { desc = "create worktree" })
