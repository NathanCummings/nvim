local config = function()
    local custom_nord = require("lualine.themes.nord")
    custom_nord.normal.c.bg = "None"

    require("lualine").setup({
        options = {
            theme = custom_nord,
            globalstatus = true,
            disabled_filetypes = { "alpha" },
            component_separators = '|',
            section_separators = { left = '', right = '' },
        },
        sections = {
            lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
            lualine_b = { "buffers" },
            lualine_x = { "encoding", { "fileformat", symbols = { unix = " " } }, "filetype" },
            lualine_y = { "progress" },
            lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } },
        },
    })
end

return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = config,
}
