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

keymap.set('n', 'H', '^', { desc = "Move to beginning of line" })
keymap.set('n', 'L', '$', { desc = "Move to end of line" })
keymap.set('n', 'J', "<C-D>", { desc = "Move half a page-screen down" })
keymap.set('n', 'K', "<C-U>", { desc = "Move half a page-screen up" })
keymap.set( {'n', 'i'}, "<C-P>", "<cmd>lua _PYTHON_TOGGLE()<CR>", {silent = true})

