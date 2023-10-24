local keymap = vim.keymap

-- Window Management
keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>")
keymap.set("n", "<leader>sh", "<cmd>split<CR>")

-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Comments
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "gc", { noremap = false })
