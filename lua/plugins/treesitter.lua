require('nvim-treesitter.configs').setup {
  ensure_installed = { 'vim', 'vimdoc', 'lua', 'c', 'query' },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  ident = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

--- Treesitter folding 
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

--- Don't fold by default
vim.wo.foldlevel = 99
vim.o.foldlevelstart = 99

