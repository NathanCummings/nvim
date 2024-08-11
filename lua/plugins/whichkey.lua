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
        whichkey.add({
            { "<leader>a",  "<cmd>Alpha<cr>",                                      desc = "Alpha" },
            { "<leader>b",  "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Buffers" },
            { "<leader>c",  "<cmd>bd!<CR>",                                        desc = "Close Buffer" },
            { "<leader>e",  "<cmd>lua MiniFiles.open()<CR>",                       desc = "File Explorer" },
            { "<leader>f",  group = "files" },
            { "<leader>ff", "<cmd>Telescope find_files<cr>",                       desc = "Find File" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                         desc = "Open Recent File" },
            { "<leader>l",  group = "LSP" },
            { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>",                   desc = "Format" },
            { "<leader>li", "<cmd>LspInfo<cr>",                                    desc = "Info" },
            { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",                 desc = "CodeLens Action" },
            { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                   desc = "Rename" },
            { "<leader>t",  group = "Telescope" },
            { "<leader>td", "<cmd>Telescope diagnostics<cr>",                      desc = "Document Diagnostics" },
            { "<leader>ts", "<cmd>Telescope lsp_document_symbols<cr>",             desc = "Document Symbols" },
            { "<leader>tS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",    desc = "Workspace Symbols" },
            { "<leader>L",  "<cmd>Lazy<CR>",                                       desc = "Lazy" },
            { "<leader>M",  "<cmd>Mason<CR>",                                      desc = "Mason" },
            { "<leader>q",  "<cmd>q!<CR>",                                         desc = "Quit" },
            { "<leader>s",  group = "Search" },
            { "<leader>sb", "<cmd>Telescope git_branches<cr>",                     desc = "Checkout branch" },
            { "<leader>sc", "<cmd>Telescope colorscheme<cr>",                      desc = "Colorscheme" },
            { "<leader>sh", "<cmd>Telescope help_tags<cr>",                        desc = "Find Help" },
            { "<leader>sM", "<cmd>Telescope man_pages<cr>",                        desc = "Man Pages" },
            { "<leader>sR", "<cmd>Telescope registers<cr>",                        desc = "Registers" },
            { "<leader>sk", "<cmd>Telescope keymaps<cr>",                          desc = "Keymaps" },
            { "<leader>sC", "<cmd>Telescope commands<cr>",                         desc = "Commands" },
            { "<leader>w",  "<cmd>w!<CR>",                                         desc = "Save" },
        })
    end,
}
