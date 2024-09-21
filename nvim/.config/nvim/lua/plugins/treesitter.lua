return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			ident = { enable = true },
		})

		--- Blade support
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "blade",
		}

		vim.api.nvim_create_augroup("BladeFiletypeRelated", { clear = true })
		vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
			pattern = "*.blade.php",
			command = "setlocal filetype=blade",
			group = "BladeFiletypeRelated",
		})

		vim.filetype.add({
			pattern = {
				[".*%.blade%.php"] = "blade",
			},
		})

		--- Fold using treesitter
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

		--- Don't fold by default
		vim.wo.foldlevel = 99
		vim.o.foldlevelstart = 99
	end,
}
