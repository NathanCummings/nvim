local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("nathan.lsp.lsp-installer")
require("nathan.lsp.handlers").setup()
require("nathan.lsp.null-ls")
