require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("folke/tokyonight.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("mbbill/undotree")

	--- Editor extensions
	use("norcalli/nvim-colorizer.lua")

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	--- LSP, completions, formatting, IDE-like stuff

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use("mhartington/formatter.nvim")

	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",
	})

	use({
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/vim-vsnip",
		"hrsh7th/vim-vsnip-integ",
	})
end)

require("plugins.lsp")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.formatter")
require("plugins.undotree")
