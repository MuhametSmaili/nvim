return {
	{ "tpope/vim-repeat", keys = { { "." }, { ";" } } },
	{
		"kylechui/nvim-surround",
		version = "*",
		keys = { { "ys" }, { "S", mode = "v" }, { "cs" }, { "ds" } },
		opts = {},
	},

	-- opposite and increment/decrement
	{
		"nat-418/boole.nvim",
		keys = { { "<C-a>" }, { "<C-x>" } },
		opts = {
			mappings = {
				increment = "<C-a>",
				decrement = "<C-x>",
			},
		},
	},
	{
		"chrisgrieser/nvim-various-textobjs",
		event = "UIEnter",
		opts = { useDefaultKeymaps = true },
	},
	-- TODO: coments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "BufReadPost",
		opts = {},
	},

	-- split join
	{
		"Wansmer/treesj",
		dependencies = "nvim-treesitter",
		keys = {
			{ "<leader>cj", "<cmd>TSJToggle<cr>", desc = "Join/split code block" },
		},
		opts = { use_default_keymaps = false },
	},

	-- UndotreeToggle
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>gu", "<cmd>UndotreeToggle<CR>", desc = "Toggle undotree" },
		},
	},

	-- Generate documentation
	{
		"danymat/neogen",
		config = true,
		keys = {
			{
				"<leader>cn",
				function()
					require("neogen").generate({})
				end,
				desc = "Generate func|class|type documentation",
			},
		},
	},

	{
		"andrewferrier/debugprint.nvim",
		opts = {},
		keys = {
			{ "g?v", mode = { "n", "x" }, desc = "Veriable log" },
			{ "g?V", mode = { "n", "x" }, desc = "Veriable log above" },
			{ "g?p", mode = { "n", "x" }, desc = "Plain debug log below" },
			{ "g?P", mode = { "n", "x" }, desc = "Plain debug log below" },
		},
		version = "*",
	},
	-- Autoclose
	{
		"windwp/nvim-ts-autotag",
		opts = {},
		event = "InsertEnter",
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
