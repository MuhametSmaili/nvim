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

	-- Vim-surround
	{
		"tpope/vim-surround",
		keys = { { "ys" }, { "S", mode = "v" }, { "cs" }, { "ds" } },
		dependencies = {
			"tpope/vim-repeat",
		},
	},

	-- TreeSj ( split/join blocks)
	{
		"wansmer/treesj",
		keys = {
			{ "<leader>m", "<cmd>TSJToggle<CR>", desc = "Toggle Treesitter Join" },
			{ "<leader>j" }, -- join
			{ "<leader>s" }, -- split
		},
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
	},

	-- Track time - nvim-wakatime
	{
		"wakatime/vim-wakatime",
		event = "VeryLazy",
	},

	-- {
	-- 	"kevinhwang91/nvim-bqf ",
	-- },

	-- jsonschema-store
	{ "b0o/schemastore.nvim" },

	-- Generate documentation
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
