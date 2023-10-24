local keymap = vim.keymap

-- Directory Navigation
keymap.set('n', "<leader>e", "<cmd>lua MiniFiles.open()<CR>", { noremap = true, silent = true})

-- Window Management
keymap.set('n', "<leader>sv", "<cmd>vsplit<CR>")
keymap.set('n', "<leader>sh", "<cmd>split<CR>")

-- Indenting
keymap.set('v', '<', "<gv")
keymap.set('v', '>', ">gv")

-- Comments
vim.api.nvim_set_keymap('n', "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap('v', "<C-/>", "gcc", { noremap = false })
