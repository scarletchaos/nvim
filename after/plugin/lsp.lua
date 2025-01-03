require("mason").setup()
local lsp = require("lsp-zero")
lsp.preset("recommended")

require("lspconfig").gopls.setup({})
require("lspconfig").pyright.setup({
	on_attach = lsp.on_attach,
	settings = {
		pyright = {
			autoImportCompletion = true,
		},
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
				typeCheckingMode = "off",
			},
		},
	},
})

require("lspconfig").lua_ls.setup({
	on_init = function(client)
		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		})
	end,
	settings = {
		Lua = {},
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "gb", function()
		vim.lsp.buf.back()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

lsp.setup()

local configs = require("lspconfig.configs")
if not configs.ruff_lsp then
	configs.ruff_lsp = {
		default_config = {
			cmd = { "ruff-lsp" },
			filetypes = { "python" },
			root_dir = require("lspconfig").util.find_git_ancestor,
			init_options = {
				settings = {
					args = {},
				},
			},
		},
	}
end
require("lspconfig").ruff_lsp.setup({
	on_attach = lsp.on_attach,
	autostart = false,
})

vim.diagnostic.config({
	virtual_text = true,
})

-- local function toggle_type_checking()
--     local lspconfig = require("lspconfig")

--     -- Safely access the settings table or initialize it if nil
--     local pyright_config = lspconfig.pyright
--     if not pyright_config.settings then
--         pyright_config.settings = { python = { analysis = { typeCheckingMode = "off" } } }
--     end

--     local current_mode = pyright_config.settings.python.analysis.typeCheckingMode or "off"

--     -- Toggle between "off" and "basic" (or "strict")
--     local new_mode = current_mode == "off" and "basic" or "off"
--     pyright_config.settings.python.analysis.typeCheckingMode = new_mode

--     -- Notify the user
--     vim.notify("Type Checking Mode: " .. new_mode, vim.log.levels.INFO)

--     -- Restart the LSP client for changes to take effect
--     for _, client in pairs(vim.lsp.get_active_clients()) do
--         if client.name == "pyright" then
--             client:stop() -- Ensure `stop()` is called properly
--             vim.defer_fn(function()
--                 vim.cmd("LspStart pyright") -- Use `LspStart` to restart the client
--             end, 100)
--         end
--     end
-- end



-- vim.keymap.set("n", "<leader>tc", toggle_type_checking, { desc = "Toggle Pyright Type Checking" })

