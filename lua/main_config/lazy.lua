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
    -- OIL 
    {
         'stevearc/oil.nvim',
         ---@module 'oil'
         ---@type oil.SetupOpts
         opts = {},
         -- Optional dependencies
         dependencies = { { "echasnovski/mini.icons", opts = {} } },
         -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
    -- TELESCOPE AND PLUGINS
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { "nvim-telescope/telescope-live-grep-args.nvim", 'nvim-lua/plenary.nvim' },
    },
    { "ThePrimeagen/git-worktree.nvim" },
    -- LSP AND AUTOCOMPLETION
    { "williamboman/mason.nvim" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/nvim-cmp" },
    {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v4.x",
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
    },
	{ "nvim-treesitter/playground" },
    -- UNDOTREE
    { "mbbill/undotree" },
    {
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
	},
    -- GIT
    { "airblade/vim-gitgutter" },
    { "tpope/vim-fugitive" },
	-- STATUS LINE
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-lualine/lualine.nvim" },
	-- MULTIPLE CURSORS ON VISUAL MODE (DEFAULT KEYBIND IS <C-N>)
    { "mg979/vim-visual-multi" },
	-- FILE TREE
    { "nvim-tree/nvim-tree.lua" },

	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	},

	-- Tagbar
    { "preservim/tagbar" },
	-- Commentary (gcc, gc)
    { "tpope/vim-commentary" },
    { "folke/trouble.nvim" },
	-- SURROUND
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{ "kevinhwang91/nvim-bqf" },
	{ "ggandor/leap.nvim" },
	{ "tpope/vim-dadbod" },
	{ "kristijanhusak/vim-dadbod-ui" },
	{ "kristijanhusak/vim-dadbod-completion" },

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
    -- harpoon
    { "theprimeagen/harpoon" },
    { "ThePrimeagen/vim-be-good" },
    { "mfussenegger/nvim-lint" },
    -- snacks
    {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      opts = {
        bigfile = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
      },
    },
    { "mistricky/codesnap.nvim", build = "make" },
})
