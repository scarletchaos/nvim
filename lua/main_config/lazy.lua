-- Install Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")

lazy.setup({
	-- COLORSCHEME
	{
		"rebelot/kanagawa.nvim", -- A beautiful colorscheme inspired by Japanese art
		name = "kanagawa",
		config = function()
			vim.cmd("colorscheme kanagawa")
		end,
	},

	-- FILE EXPLORATION
	{
		"stevearc/oil.nvim", -- Simplified file navigation and exploration
		opts = {},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		config = function()
			require("plugins.oil")
		end,
	},

	-- TELESCOPE AND EXTENSIONS
	{
		"nvim-telescope/telescope.nvim", -- Powerful fuzzy finder for files, buffers, and more
		tag = "0.1.8",
		event = "VeryLazy",
		dependencies = { "nvim-telescope/telescope-live-grep-args.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.telescope")
		end,
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Fuzzy finder acceleration with FZF

	-- GIT WORKFLOW
	{
		"ThePrimeagen/git-worktree.nvim", -- Manage and switch between Git worktrees
		config = function()
			require("plugins.worktree")
		end,
	},

	-- LSP, AUTOCOMPLETION, AND AI
	{ "williamboman/mason.nvim" }, -- Manage LSP servers, linters, and formatters
	{ "hrsh7th/cmp-nvim-lsp" }, -- LSP-based autocompletion
	{ "hrsh7th/cmp-buffer" }, -- Autocompletion from buffer content
	{ "hrsh7th/cmp-path" }, -- Autocompletion for file paths
	{ "hrsh7th/cmp-cmdline" }, -- Autocompletion for Vim command-line
	{
		"hrsh7th/nvim-cmp", -- Main autocompletion plugin
		config = function()
			require("plugins.cmp")
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim", -- Simplified LSP setup with sensible defaults
		branch = "v3.x",
		dependencies = {
			{ "neovim/nvim-lspconfig" }, -- Core LSP configurations
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "L3MON4D3/LuaSnip" }, -- Snippet engine for autocompletion
		},
	},
	{
		"zbirenbaum/copilot.lua", -- GitHub Copilot integration for AI-powered autocompletions
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("plugins.copilot")
		end,
	},

	-- TREESITTER
	{
		"nvim-treesitter/nvim-treesitter", -- Syntax highlighting and code parsing
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},
	{ "nvim-treesitter/playground" }, -- Inspect Treesitter syntax nodes interactively

	-- GIT INTEGRATION
	{ "airblade/vim-gitgutter" }, -- Show Git diff indicators in the gutter
	{
		"tpope/vim-fugitive", -- Git commands within Vim
		config = function()
			require("plugins.fugitive")
		end,
	},

	-- STATUS LINE AND ICONS
	{ "nvim-tree/nvim-web-devicons" }, -- File type icons for Neovim
	{ "echasnovski/mini.icons" }, -- Additional icon support for plugins
	{
		"nvim-lualine/lualine.nvim", -- Highly configurable status line
		config = function()
			require("plugins.lualine")
		end,
	},

	-- MULTIPLE CURSORS
	{ "mg979/vim-visual-multi" }, -- Support for multiple cursors like VS Code

	-- NAVIGATION
	{
		"ggandor/leap.nvim", -- Fast and intuitive motions within files
		dependencies = { "tpope/vim-repeat" },
		config = function()
			require("leap").create_default_mappings()
		end,
	},
	{
		"theprimeagen/harpoon", -- Efficient file and buffer navigation
		event = "VeryLazy",
		config = function()
			require("plugins.harpoon")
		end,
	},

	-- DEBUGGING
	{
		"rcarriga/nvim-dap-ui", -- Debug Adapter Protocol UI for debugging
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("plugins.dap")
		end,
	},
	{ "mfussenegger/nvim-dap-python" }, -- Python debugging support
	{ "theHamsta/nvim-dap-virtual-text" }, -- Inline virtual text for DAP

	-- UTILITIES
	{
		"mbbill/undotree", -- Visualize and manage undo history
		config = function()
			require("plugins.undotree")
		end,
	},
	{
		"folke/which-key.nvim", -- Display available keymaps on pressing `<leader>`
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},
	{ "tpope/vim-dadbod" }, -- Database exploration and management
	{ "kristijanhusak/vim-dadbod-ui" }, -- UI for vim-dadbod
	{ "kristijanhusak/vim-dadbod-completion" }, -- Autocompletion for database queries

	-- TEXT MANIPULATION
	{ "tpope/vim-commentary" }, -- Comment and uncomment code
	{
		"kylechui/nvim-surround", -- Manage surrounding text (quotes, brackets, etc.)
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- CHUNK HIGHLIGHTING
	{
		"shellRaining/hlchunk.nvim", -- Highlight indentation levels and code chunks
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.hlchunk")
		end,
	},

	-- LINTERS AND FORMATTERS
	{
		"mfussenegger/nvim-lint", -- Linting support for multiple languages
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.lint")
		end,
	},
	{
		"stevearc/conform.nvim", -- Formatting engine for various file types
		event = "VeryLazy",
		config = function()
			require("plugins.conform")
		end,
	},

	-- MISC
	{
		"folke/trouble.nvim", -- Pretty diagnostics and references list
		opts = {}, -- Default options
		cmd = "Trouble",
	},
	{
		import = "plugins.snacks", -- Snacks.nvim for enhanced UI features
	},
	{ "mistricky/codesnap.nvim", build = "make" }, -- Generate code snapshots for sharing
	{ "ThePrimeagen/vim-be-good" }, -- Fun plugin for improving Vim motions
	{ "kevinhwang91/nvim-bqf" }, -- Better quickfix window UI
	{ "preservim/tagbar" }, -- Show tags (functions, variables) in a sidebar
	{
		"windwp/nvim-autopairs", -- Automatically close brackets, quotes, etc.
		event = "InsertEnter",
		config = true,
	},
})
