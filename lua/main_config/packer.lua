vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("williamboman/mason.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-telescope/telescope-live-grep-args.nvim", "nvim-lua/plenary.nvim" } },
	})

	use({
		"rebelot/kanagawa.nvim",
		as = "kanagawa",
		config = function()
			vim.cmd("colorscheme kanagawa")
		end,
	})
	-- treesitter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	-- harpoon
	use("theprimeagen/harpoon")
	-- undo tree
	use("mbbill/undotree")
	use("ThePrimeagen/vim-be-good")
	use("mfussenegger/nvim-lint")
	-- autocompletion engine
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	--lsp-zero
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})

	-- git
	use("airblade/vim-gitgutter")
	use("tpope/vim-fugitive")
	-- status line
	use("nvim-tree/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	-- multiple cursors on visual mode (default keybind is <C-n>)
	use("mg979/vim-visual-multi")
	-- file tree
	use("nvim-tree/nvim-tree.lua")

	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})

	-- Tagbar
	use("preservim/tagbar")

	-- Commentary (gcc, gc)
	use("tpope/vim-commentary")

	-- use{"neoclide/coc.nvim", branch="release"}
	-- Lua
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use("folke/trouble.nvim")
	-- SURROUND
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})
	use("stevearc/oil.nvim")
	use({ "kevinhwang91/nvim-bqf" })
	use({ "ggandor/leap.nvim" })
	use({ "tpope/vim-dadbod" })
	use({ "kristijanhusak/vim-dadbod-ui" })
	use({ "kristijanhusak/vim-dadbod-completion" })
	use({ "ThePrimeagen/git-worktree.nvim" })
	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({
		"oysandvik94/curl.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({
		"folke/noice.nvim",
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	})
	use({
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("hlchunk").setup({
				chunk = {
					enable = true,
					duration = 0,
					delay = 0,
					-- ...
				},
				indent = {
					enable = false,
					-- ...
				},
			})
		end,
	})
end)
