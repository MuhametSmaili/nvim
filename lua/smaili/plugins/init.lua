--------------------------------------------------------
-- Plugins
--------------------------------------------------------
return {
	-- Colorshema
	{
		"folke/tokyonight.nvim",
		event = "VeryLazy",
	},

	{
		name = "dracula_pro",
		dir = "~/.local/share/nvim/site/pack/themes/start/dracula_pro",
	},

	-- Autoclose
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup({})
		end,
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
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},

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

	-- GIT
	{ "mbbill/undotree", event = "VeryLazy" },
}
