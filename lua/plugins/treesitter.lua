return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require('nvim-treesitter.configs').setup {
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting=false,
			},
			ident = { enable = true },
		}

		vim.wo.foldmethod = 'expr'
		vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

		--- Don't fold by default
		vim.wo.foldlevel = 99
		vim.o.foldlevelstart = 99
	end
}
