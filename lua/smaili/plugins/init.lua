--------------------------------------------------------
-- Plugins
--------------------------------------------------------
return {
	-- Autoclose
	{
		"m4xshen/autoclose.nvim",
		opts = {},
		event = "VeryLazy",
	},

	{
		"NvChad/nvim-colorizer.lua",
		config = true,
		event = "VeryLazy",
	},

	-- Vim-surround
	{
		"tpope/vim-surround",
		event = "VeryLazy",
	},

	-- Track time - nvim-wakatime
	{
		"wakatime/vim-wakatime",
		event = "VeryLazy",
	},

	-- jsonschema-store
	{ "b0o/schemastore.nvim" },

	-- Better UI
	-- {
	-- 	"stevearc/dressing.nvim",
	-- 	event = "VeryLazy",
	-- },

	--Lsp-figet
	{
		"j-hui/fidget.nvim",
		config = true,
		event = "VeryLazy",
	},
	{
		"folke/neodev.nvim",
		config = true,
		event = "VeryLazy",
	},

	-- Undo tree visualization
	{ "mbbill/undotree", event = "VeryLazy" },
}
