require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.INFO,

	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.keymap.set("n", "<leader>f", ":Format<CR>")
