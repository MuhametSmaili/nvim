local M = {
	"neovim/nvim-lspconfig",
	event = "BufReadPost",
	dependencies = {
		{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } }, -- ADDITONAL LUA configuration for documentation
		"mason.nvim", -- installing LSPs automaticlly
		"williamboman/mason-lspconfig.nvim", -- lsp configuration for mason lsp
		"j-hui/fidget.nvim", -- status for lsp
		-- Autocompletion
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
	},
}

return M
