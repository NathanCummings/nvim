local config = function()
	local theme = require("lualine.themes.gruvbox-material")

	require("lualine").setup({
		options = {
			theme = theme,
			globalstatus = true,
			disabled_filetypes = { "alpha" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "buffers" },
			lualine_x = { "encoding", "fileformat", "filetype" },
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
