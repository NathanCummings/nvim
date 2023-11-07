return {
	"akinsho/toggleterm.nvim",
	lazy = false,
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<C-t>]],
			direction = "float",
			float_opts = { border = "curved" },
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local python = Terminal:new({ cmd = "python", hidden = true })

		function _PYTHON_TOGGLE()
			python:toggle()
		end
	end,
}
