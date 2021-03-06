local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("kyazdani42/nvim-web-devicons") -- icons for things like the file explorer
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("folke/which-key.nvim") -- opens a popup with suggestions to complete a key binding
	use("kyazdani42/nvim-tree.lua") -- file explorer written in lua
	use("moll/vim-bbye") -- close buffers
	use("windwp/nvim-autopairs") -- autopairs, integrates with both cmp and treesitter
	use("akinsho/bufferline.nvim") -- see open buffers along the top
	use("akinsho/toggleterm.nvim") -- a handy terminal
	use("nvim-lualine/lualine.nvim") -- neovim status line
	use("lukas-reineke/indent-blankline.nvim") -- see indents
	use("goolord/alpha-nvim") -- a lua-powered greeter
	use("ahmedkhalf/project.nvim") -- project management
	use("christoomey/vim-tmux-navigator") -- seamlessly move around vim and tmux splits
    use("ellisonleao/glow.nvim") -- markdown previewer

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp") -- lsp completions
	use("hrsh7th/cmp-nvim-lua") -- lua completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Telescope
	use("nvim-telescope/telescope.nvim") -- finding files, text, etc...

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter", -- syntax parsing
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow") -- colourful parenthesis
	use("JoosepAlviste/nvim-ts-context-commentstring") -- set comment string based on cursor location

	-- Git
	use("lewis6991/gitsigns.nvim") -- git decorations

	-- Colourschemes
	use("shaunsingh/nord.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
