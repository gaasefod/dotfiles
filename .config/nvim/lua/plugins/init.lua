return {
	"nvim-lua/plenary.nvim",

	-- lsp
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lua",
	"jose-elias-alvarez/null-ls.nvim",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- navigtaion
	"ggandor/leap.nvim",
	"akinsho/toggleterm.nvim",
	"nvim-tree/nvim-tree.lua",
	{ "nvim-telescope/telescope.nvim", tag = "0.1.1" },
	"folke/trouble.nvim",

	-- colorschemes
	{ "AlexvZyl/nordic.nvim", priority = 1000 },

	-- editor
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"lukas-reineke/indent-blankline.nvim",

	-- snippets
	{ "L3MON4D3/LuaSnip", version = "v1.2.1.*" },
	"saadparwaiz1/cmp_luasnip",

	-- git (lazygit is configured too, its a must have)
	{ "lewis6991/gitsigns.nvim" },
	"tpope/vim-fugitive",

	-- testing
	"vim-test/vim-test",
}
