local mapkey = require("util.keymapper").mapkey

local M = {}

local add_desctiption = function(options, description)
  options.desc = description
  return options
end

-- set keymaps on the active lsp server
M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	mapkey("<leader>fd", "Lspsaga finder", "n", add_desctiption(opts, "Show references"))
  mapkey("<leader>gd", "Lspsaga peek_definition", "n", add_desctiption(opts, "Peek definition"))
	mapkey("<leader>gD", "Lspsaga goto_definition", "n", add_desctiption(opts, "Go to definition"))
	mapkey("<leader>ca", "Lspsaga code_action", "n", add_desctiption(opts, "see available code actions"))
	mapkey("<leader>rn", "Lspsaga rename", "n", add_desctiption(opts, "Rename"))
	mapkey("<leader>D", "Lspsaga show_line_diagnostics", "n", add_desctiption(opts, "Line diagnostics"))
	mapkey("<leader>d", "Lspsaga show_cursor_diagnostics", "n", add_desctiption(opts, "Cursor diagnostics"))
	mapkey("<leader>pd", "Lspsaga diagnostic_jump_prev", "n", add_desctiption(opts, "Previous diagnostic"))
	mapkey("<leader>nd", "Lspsaga diagnostic_jump_next", "n", add_desctiption(opts, "Next diagnostic"))
	mapkey("K", "Lspsaga hover_doc", "n", add_desctiption(opts, "Documentation for symbol under cursor"))

	if client.name == "pyright" then
		mapkey("<Leader>oi", "PyrightOrganizeImports", "n", add_desctiption(opts, "Organise imports"))
	end
end

M.diagnostic_signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }

return M
