--- Use system clipboard globally
vim.opt.clipboard:append("unnamedplus")

--- Hybrid line numbers
vim.wo.relativenumber = true
vim.wo.number = true

--- Better default indents
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true

--- Enable mouse support
vim.opt.mouse = "a"
