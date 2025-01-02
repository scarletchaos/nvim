return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		-- indent = { enabled = true },
		input = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		quickfile = { enabled = true },
		-- scroll = { enabled = true },
		-- statuscolumn = { enabled = true },
		words = { enabled = true },
		styles = {
			notification = {
				-- wo = { wrap = true } -- Wrap notifications
			},
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				Snacks.toggle.diagnostics():map("<leader>ud")
				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>uc")
				Snacks.toggle.treesitter():map("<leader>uT")
				Snacks.toggle
					.option("background", { off = "light", on = "dark", name = "Dark Background" })
					:map("<leader>ub")
				Snacks.toggle.inlay_hints():map("<leader>uh")
				Snacks.toggle.indent():map("<leader>ug")
				Snacks.toggle.dim():map("<leader>uD")
				vim.keymap.set("n", "<leader>z", function()
					Snacks.zen()
				end, { desc = "Toggle Zen Mode" })
				vim.keymap.set("n", "<leader>Z", function()
					Snacks.zen.zoom()
				end, { desc = "Toggle Zoom" })
				vim.keymap.set("n", "<leader>.", function()
					Snacks.scratch()
				end, { desc = "Toggle Scratch Buffer" })
				vim.keymap.set("n", "<leader>S", function()
					Snacks.scratch.select()
				end, { desc = "Select Scratch Buffer" })
				vim.keymap.set("n", "<leader>n", function()
					Snacks.notifier.show_history()
				end, { desc = "Notification History" })
				vim.keymap.set("n", "<leader>bd", function()
					Snacks.bufdelete()
				end, { desc = "Delete Buffer" })
				vim.keymap.set("n", "<leader>cR", function()
					Snacks.rename.rename_file()
				end, { desc = "Rename File" })
				vim.keymap.set({ "n", "v" }, "<leader>gB", function()
					Snacks.gitbrowse()
				end, { desc = "Git Browse" })
				vim.keymap.set("n", "<leader>gb", function()
					Snacks.git.blame_line()
				end, { desc = "Git Blame Line" })
				vim.keymap.set("n", "<leader>gf", function()
					Snacks.lazygit.log_file()
				end, { desc = "Lazygit Current File History" })
				vim.keymap.set("n", "<leader>gg", function()
					Snacks.lazygit()
				end, { desc = "Lazygit" })
				vim.keymap.set("n", "<leader>gl", function()
					Snacks.lazygit.log()
				end, { desc = "Lazygit Log (cwd)" })
				vim.keymap.set("n", "<leader>un", function()
					Snacks.notifier.hide()
				end, { desc = "Dismiss All Notifications" })
				vim.keymap.set("n", "<c-/>", function()
					Snacks.terminal()
				end, { desc = "Toggle Terminal" })
				vim.keymap.set("n", "<c-_>", function()
					Snacks.terminal()
				end, { desc = "which_key_ignore" })
				vim.keymap.set({ "n", "v" }, "]]", function()
					Snacks.words.jump(vim.v.count1)
				end, { desc = "Next Reference" })
				vim.keymap.set({ "n", "v" }, "[[", function()
					Snacks.words.jump(-vim.v.count1)
				end, { desc = "Prev Reference" })
			end,
		})
	end,
}
