return {
	"folke/which-key.nvim",
	lazy = false,
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local whichkey = require("which-key")
		whichkey.setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})
		whichkey.register({
			["<leader>"] = {
				a = { "<cmd>Alpha<cr>", "Alpha" },
				b = {
					"<cmd>lua require('telescope.builtin').buffers()<cr>",
					"Buffers",
				},
				c = { "<cmd>bd!<CR>", "Close Buffer" },
				e = { "<cmd>lua MiniFiles.open()<CR>", "File Explorer" },
				f = {
					name = "files",
					f = { "<cmd>Telescope find_files<cr>", "Find File" },
					r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
				},
				g = { name = "Go" },
				l = {
					name = "LSP",
					d = {
						"<cmd>Telescope diagnostics<cr>",
						"Document Diagnostics",
					},
					f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
					i = { "<cmd>LspInfo<cr>", "Info" },
					l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
					r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
					s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
					S = {
						"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
						"Workspace Symbols",
					},
				},
				q = { "<cmd>q!<CR>", "Quit" },
				s = {
					name = "Search",
					b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
					c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
					h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
					M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
					r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
					R = { "<cmd>Telescope registers<cr>", "Registers" },
					k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
					C = { "<cmd>Telescope commands<cr>", "Commands" },
				},
				w = { "<cmd>w!<CR>", "Save" },
			},
		})
	end,
}
