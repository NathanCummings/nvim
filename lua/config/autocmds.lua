vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
    pattern = "*",
    callback = function()
        local buf = vim.api.nvim_get_current_buf()

        -- Exclude mini.files, lspinfo, or other specific filetypes
        local excluded_filetypes = { minifiles = true }
        local filetype = vim.bo[buf].filetype
        if excluded_filetypes[filetype] then
            return
        end

        -- Ensure the buffer has an active LSP client before formatting
        local clients = vim.lsp.get_clients({ bufnr = buf })
        if not clients or vim.tbl_isempty(clients) then
            return
        end

        if vim.fn.mode() == "n" then
            vim.defer_fn(function()
                if vim.api.nvim_buf_is_valid(buf) then
                    vim.lsp.buf.format({ bufnr = buf })
                end
            end, 100)
        end
    end,
})

Lualine = require("plugins.lualine-nvim")
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.schedule(Lualine.config)
    end,
})
