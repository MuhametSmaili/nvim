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
			{ "<leader>cj", "<cmd>TSJToggle<CR>", desc = "Toggle Treesitter Join" },
		},
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
		opts = { use_default_keymaps = false },
	},

	-- Track time - nvim-wakatime
	-- {
	-- "wakatime/vim-wakatime",
	-- event = "VeryLazy",
	-- },

	-- {
	-- 	"kevinhwang91/nvim-bqf ",
	-- },

	-- jsonschema-store
	-- { "b0o/schemastore.nvim" },

	-- Generate documentation
	{
		"danymat/neogen",
		config = true,
		keys = {
			{ "<leader>cn", "<cmd>Neogen<CR>", desc = "Generate func|class|type documentation" },
		},
	},

	-- Undo tree visualization
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>gu", "<cmd>UndotreeToggle<CR>", desc = "Toggle undotree" },
		},
	},

	-- copy to the system clipboard
	{
		"christoomey/vim-system-copy",
		keys = {
			{ "cp", desc = "Copy to system clipboard(motion)" },
			{ "cv", desc = "Paste from system clipboard(motion)" },
		},
	},
}
