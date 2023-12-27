local config = function()
	local custom_nord = require("lualine.themes.nord")
	custom_nord.normal.c.bg = "None"

	require("lualine").setup({
		options = {
			theme = custom_nord,
			globalstatus = true,
			disabled_filetypes = { "alpha" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "buffers" },
			lualine_x = { "encoding", { "fileformat", symbols = { unix = "" } }, "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
