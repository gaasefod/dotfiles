local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[ packadd packer.nvim ]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- check if we can require packer
local ok, packer = pcall(require, "packer")

if not ok then
	error("Packer could not be required")
end

return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim")

	use({
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
		},
	})

	-- lsp
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lua")
	use("jose-elias-alvarez/null-ls.nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- navigation
	use("ggandor/leap.nvim")
	use("akinsho/toggleterm.nvim")
	use("nvim-tree/nvim-tree.lua")
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })
	use("folke/trouble.nvim")

	-- colorschemes
	use("sainnhe/gruvbox-material")

	-- editor
	use("nvim-tree/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("LunarWatcher/auto-pairs")

	-- snippets
	use({ "L3MON4D3/LuaSnip", version = "v1.2.1.*" })
	use("saadparwaiz1/cmp_luasnip")

	-- git (lazygit is configured too, its a must have)
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")

	-- testing
	use("vim-test/vim-test")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
