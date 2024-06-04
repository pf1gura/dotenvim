return {
  "vim-test/vim-test",
  config = function()
    vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", {})
    vim.keymap.set("n", "<leader>T", ":TestFile<CR>", {})
		vim.cmd("let test#strategy = 'neovim_sticky'")
  end,
}
