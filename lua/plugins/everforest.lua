return {
	"neanias/everforest-nvim",
	lazy = false,
	priority = 999,
	config = function()
		vim.cmd("colorscheme everforest")
		vim.g.nord_borders = true
	end,
}
