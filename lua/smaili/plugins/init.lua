--------------------------------------------------------
-- Plugins
--------------------------------------------------------
return {
	-- Autoclose
	{
		"m4xshen/autoclose.nvim",
		opts = {},
		event = "InsertEnter",
	},

	-- {
	-- 	"NvChad/nvim-colorizer.lua",
	-- 	config = true,
	-- 	event = "VeryLazy",
	-- },

	-- Vim-surround
	{
		"tpope/vim-surround",
		keys = { { "ys" }, { "S", mode = "v" }, { "cs" } },
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
	-- 	event = "BufReadPost",
	-- },
	{
		"danymat/neogen",
		config = true,
		keys = {
			{ "<leader>ln", "<cmd>Neogen<CR>", desc = "Generate func|class|type documentation" },
		},
	},

	-- Undo tree visualization
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>gu", "<cmd>UndotreeToggle<CR>", desc = "Toggle undotree" },
		},
	},
}
