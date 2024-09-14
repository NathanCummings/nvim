return {
    "echasnovski/mini.files",
    version = false,
    lazy = false,
    -- opts = { mappings = { go_in_plus = '<CR>', synchronize = 's' }, windows = { preview = true, width_preview = 80 } },
    config = function()
        require("mini.files").setup { mappings = { go_in_plus = '<CR>', synchronize = 's' }, windows = { preview = true, width_preview = 80 } }
        -- Add rounded corners
        vim.api.nvim_create_autocmd('User', {
            pattern = 'MiniFilesWindowOpen',
            callback = function(args)
                local win_id = args.data.win_id
                vim.api.nvim_win_set_config(win_id, { border = 'rounded' })
            end,
        })
        vim.cmd("highlight MiniFilesTitle guibg=#00ffffff")
        vim.cmd("highlight MiniFilesTitleFocused guibg=#00ffffff")
        vim.cmd("highlight MiniFilesBorder none")
    end
}
