local keymap = vim.keymap

local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			file_ignore_patters = { "%.git/.*" },
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = false,
				hidden = true,
			},
			live_grep = {
				theme = "dropdown",
				previewer = false,
			},
			buffers = {
				theme = "dropdown",
				previewer = false,
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
	keys = {
		keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>"),
		keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>"),
		keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>"),
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>"),
	},
}
