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
	"rebelot/kanagawa.nvim",
	name = "kanagawa",
	config = function()
		vim.cmd("colorscheme kanagawa")
	end,
    },

    -- FILE EXPLORATION
    {
         'stevearc/oil.nvim',
         ---@module 'oil'
         ---@type oil.SetupOpts
         opts = {},
         dependencies = { { "echasnovski/mini.icons", opts = {} } },
         config = function()
             require("plugins.oil")
         end,
    },

    -- TELESCOPE AND EXTENSIONS
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        event = "VeryLazy",
        dependencies = { "nvim-telescope/telescope-live-grep-args.nvim", 'nvim-lua/plenary.nvim' },
        config = function()
            require("plugins.telescope")
        end,
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
        "ThePrimeagen/git-worktree.nvim",
        config = function()
            require("plugins.worktree")
        end,
    },

    -- LSP AND AUTOCOMPLETION
    { "williamboman/mason.nvim" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.cmp")
        end,
    },
    {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ "williamboman/mason.nvim" }, -- Optional
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		{ "L3MON4D3/LuaSnip" }, -- Required
	},
    },

    -- TREESITTER
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("plugins.treesitter")
        end,
    },
    { "nvim-treesitter/playground" },

    -- GIT INTEGRATION
    { "airblade/vim-gitgutter" },
    {
        "tpope/vim-fugitive",
        config = function()
            require("plugins.fugitive")
        end,
    },

    -- STATUS LINE AND ICONS
    { "nvim-tree/nvim-web-devicons" },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugins.lualine")
        end,
    },

    -- MULTIPLE CURSORS
    { "mg979/vim-visual-multi" },

    -- NAVIGATION
    {
        "ggandor/leap.nvim",
        dependencies = {"tpope/vim-repeat"},
        config = function()
            require('leap').create_default_mappings()
        end,
    },
    {
        "theprimeagen/harpoon",
        event = "VeryLazy",
        config = function()
            require("plugins.harpoon")
        end,
    },

    -- DEBUGGING
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        config = function()
            require("plugins.dap")
        end,
    },
    { "mfussenegger/nvim-dap-python" },
    { "theHamsta/nvim-dap-virtual-text" },

    -- UTILITIES
    {
        "mbbill/undotree",
        config = function()
            require("plugins.undotree")
        end,
    },
    {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},
    { "tpope/vim-dadbod" },
    { "kristijanhusak/vim-dadbod-ui" },
    { "kristijanhusak/vim-dadbod-completion" },

    -- TEXT MANIPULATION
    { "tpope/vim-commentary" },
    {
		"kylechui/nvim-surround",
		version = "*",
        event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

    -- CHUNK HIGHLIGHTING
    {
      "shellRaining/hlchunk.nvim",
      config = function()
        require('hlchunk').setup({
            indent = {
                chars = { "│", "¦", "┆", "┊", },
                style = {
                    "#8B00FF",
                },
            },
            blank = {
                enable = false,
            }
        })
      end,
    },

    -- LINTERS AND FORMATTERS
    {
        "mfussenegger/nvim-lint",
        config = function()
            require("plugins.lint")
        end,
    },
    {
        "stevearc/conform.nvim",
        event = "VeryLazy",
		config = function()
			require("plugins.conform")
		end,
	},

    -- MISC
    {
        "folke/trouble.nvim" },
    {
        "folke/snacks.nvim",
        event = 'VeryLazy',
        priority = 1000,
        -- lazy = false,
        opts = {
            bigfile = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
        config = function()
            require("plugins.snacks")
        end,
    },
    { "mistricky/codesnap.nvim", build = "make" },
    { "ThePrimeagen/vim-be-good" },
    { "kevinhwang91/nvim-bqf" },
    { "preservim/tagbar" },
    {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    },
})

