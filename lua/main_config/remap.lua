local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Leader key
vim.g.mapleader = " "

-- General keymaps
keymap("n", "<leader>pv", vim.cmd.Ex, { desc = ":Ex" })
keymap("n", "<leader>-", vim.cmd.split, { desc = ":split" })
keymap("n", "<leader>|", vim.cmd.vsplit, { desc = ":vsplit" })

-- Insert mode shortcuts
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
keymap("i", "<C-c>", "<Esc>")

-- Visual mode shortcuts
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Navigation improvements
keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Clipboard and paste
keymap("x", "<leader>p", [["_dP]], { desc = "Paste without buffering" })
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])
keymap({ "n", "v" }, "<leader>d", [["_d]], { desc = "d without buffering" })
keymap({ "n", "v" }, "<leader>c", [["_c]], { desc = "c without buffering" })

-- Command quickfix navigation
keymap("n", "Q", "<nop>")
keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Text replacements
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace under cursor" })
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Configuration editing
keymap("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/goshan/packer.lua<CR>")
keymap("n", "<leader><leader>", function()
	vim.cmd("so")
end, { desc = "source this" })

-- Git integration
-- keymap("n", "<leader>ga", "<cmd>G add %<CR>", { desc = "git add this" })
-- keymap("n", "<leader>gc", "<cmd>G commit<CR>", { desc = "git commit" })
-- keymap("n", "<leader>gk", "<cmd>G push<CR>", { desc = "git push" })
-- keymap("n", "<leader>gj", "<cmd>G pull --rebase<CR>", { desc = "git pull --rebase" })
-- keymap("n", "<leader>gJ", "<cmd>G pull<CR>", { desc = "git pull" })
-- keymap("n", "<leader>gl", "<cmd>G log --oneline --decorate --graph --all<CR>", { desc = "git log but fancy" })
keymap("n", "<leader>gs", vim.cmd.Git, { desc = "open fugitive pane" })

-- Window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Plugins
-- Tagbar
keymap("n", "<leader>tb", "<cmd>TagbarToggle<CR>")
-- Oil
keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- Trouble
keymap("n", "<leader>xx", function()
	require("trouble").toggle()
end, { desc = "toggle error view" })
keymap("n", "<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end, { desc = "toggle workspace diagnostics" })
keymap("n", "<leader>xd", function()
	require("trouble").toggle("document_diagnostics")
end, { desc = "toggle document diagnostics" })
keymap("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end, { desc = "toggle quickfix" })
keymap("n", "<leader>xl", function()
	require("trouble").toggle("loclist")
end, { desc = "toggle loclist" })
keymap("n", "gR", function()
	require("trouble").toggle("lsp_references")
end, { desc = "toggle lsp references" })

-- Toggle line numbers
function ToggleLineNumbers()
    if vim.wo.relativenumber then
        vim.wo.relativenumber = false
        vim.wo.number = true
    else
        vim.wo.relativenumber = true
        vim.wo.number = true
    end
end
keymap("n", "<leader>rl", ToggleLineNumbers, { desc = "toggle relative line numbers" })

-- Ruff toggle
local ruff_active = true
vim.keymap.set("n", "<leader>tr", function()
	ruff_active = not ruff_active
	if ruff_active then
		vim.cmd("LspStart ruff-lsp")
	else
		vim.cmd("LspStop ruff-lsp")
	end
end)

-- Run script
keymap("n", "<leader>rp", "<cmd>!./run.sh<CR>")
