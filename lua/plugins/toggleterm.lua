return {
	"akinsho/toggleterm.nvim",
        lazy = false,
	version = "*",
	opts = {
		open_mapping = [[<C-t>]],
                shade_terminals = false,
                direction = "float",
		float_opts = { border = "curved" },
	},
	config = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local python = Terminal:new({ cmd = "python", hidden = true })

		function _PYTHON_TOGGLE()
			python:toggle()
		end
	end
}
