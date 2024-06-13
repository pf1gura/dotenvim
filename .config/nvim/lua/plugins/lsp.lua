return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({
				capabilities = lsp_capabilities,
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					},
				},
			})

			lspconfig.rust_analyzer.setup({
				capabilities = lsp_capabilities,
				on_attach = function(_, bufnr)
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end,
				settings = {
					["rust-analyzer"] = {
						imports = {
							granularity = {
								group = "module",
							},
							prefix = "self",
						},
						cargo = {
							buildScripts = {
								enable = true,
							},
						},
						procMacro = {
							enable = true,
						},
					},
				},
			})

			lspconfig.tailwindcss.setup({
				capabilities = lsp_capabilities,
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = {
								"@?class\\(([^]*)\\)",
								"'([^']*)'",
							},
						},
					},
				},
			})

			lspconfig.intelephense.setup({
				capabilities = lsp_capabilities,
				settings = {
					filetypes = { "php", "blade" },
					settings = {
						intelephense = {
							filetypes = { "php", "blade" },
							files = {
								associations = { "*.php", "*.blade.php" },
								maxSize = 5000000,
							},
						},
					},
				},
			})

			local emmet_capabilities = lsp_capabilities
			emmet_capabilities.textDocument.completion.completionItem.snippetSupport = true

			lspconfig.emmet_ls.setup({
				capabilities = emmet_capabilities,
				settings = {
					filetypes = {
						"astro",
						"blade",
						"css",
						"eruby",
						"html",
						"htmldjango",
						"javascriptreact",
						"less",
						"pug",
						"sass",
						"scss",
						"svelte",
						"typescriptreact",
						"vue",
					},
				},
			})

			lspconfig.zls.setup({
				capabilities = lsp_capabilities,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "K", function()
						vim.lsp.buf.hover()
					end, opts)

					vim.keymap.set("n", "<leader>gd", function()
						vim.lsp.buf.definition()
					end, opts)

					vim.keymap.set("n", "<leader>gr", function()
						vim.lsp.buf.references()
					end, opts)

					vim.keymap.set("n", "<leader>ca", function()
						vim.lsp.buf.code_action()
					end, opts)
				end,
			})
		end,
	},
}
