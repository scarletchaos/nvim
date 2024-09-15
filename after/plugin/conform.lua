local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "autopep8", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd", "prettier" } },
	},
})

local conform_group = vim.api.nvim_create_augroup("conform", { clear = true })

vim.keymap.set({ "n", "v" }, "<leader>f", function() -- Make prettier
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "format file or range (in visual mode)" })
