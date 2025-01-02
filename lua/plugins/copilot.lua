require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
		keymap = {
			accept = "<Tab>", -- Customize key to accept suggestions
			next = "<C-j>", -- Key to navigate to the next suggestion
			prev = "<C-k>", -- Key to navigate to the previous suggestion
			dismiss = "<C-c>", -- Key to dismiss suggestions
		},
	},
	panel = {
		enabled = true,
	},
})

-- Ensure Copilot is authenticated
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.cmd("Copilot auth")
	end,
	desc = "Ensure Copilot authentication",
})

-- Debugging commands
vim.api.nvim_set_keymap(
	"n",
	"<leader>cd",
	":Copilot debug<CR>",
	{ noremap = true, silent = true, desc = "Debug Copilot" }
)

-- Toggle Copilot suggestions
vim.api.nvim_set_keymap(
	"n",
	"<leader>ct",
	":Copilot toggle<CR>",
	{ noremap = true, silent = true, desc = "Toggle Copilot" }
)
