local lint = require("lint")

-- Linters by file type
lint.linters_by_ft = {
    markdown = { "vale" },
    python = { "ruff" },
    lua = { "luacheck" },
}

-- Keymap to manually trigger linting
vim.keymap.set("n", "<leader>l", function()
    lint.try_lint()
end, { desc = "run linters" })

-- Auto lint on specific events (optional, commented out)
-- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
--     group = lint_augroup,
--     callback = function()
--         lint.try_lint()
--     end,
-- })

