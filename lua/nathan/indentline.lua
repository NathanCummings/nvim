local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
}
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

indent_blankline.setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})
