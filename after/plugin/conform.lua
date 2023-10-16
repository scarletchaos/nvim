local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd", "prettier" } },
	},
})

local conform_group = vim.api.nvim_create_augroup("conform", { clear = true })

--vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--	group = conform_group,
--	callback = function()
--		conform.format({
--			lsp_fallback = true,
--			async = false,
--			timeout_ms = 1000,
--		})
--	end,
--})
--
--



vim.keymap.set({ "n", "v" }, "<leader>f", function() -- Make prettier
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })
