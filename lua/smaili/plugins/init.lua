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

	-- smooth scrolling
	{
		"karb94/neoscroll.nvim",
		keys = { { "<c-u>" }, { "zz" }, { "<c-d>" }, { "<c-e>" }, { "<c-y>" } },
		opts = {},
	},

	-- TreeSj ( split/join blocks)
	{
		"wansmer/treesj",
		keys = {
			{ "<leader>m", "<cmd>TSJToggle<CR>", desc = "Toggle Treesitter Join" },
		},
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
		opts = { use_default_keymaps = false },
	},

	-- Higlight unqiue letter in the row, to quickly move
	{
		"unblevable/quick-scope",
		keys = { { "f" }, { "F" }, { "t" }, { "T" } },
	},

	-- Track time - nvim-wakatime
	{
		"wakatime/vim-wakatime",
		event = "VeryLazy",
	},

	--do not overuse hjkl
	{
		"m4xshen/hardtime.nvim",
		event = "VeryLazy",
		opts = {
			disable_mouse = false,
			notification = false,
			restricted_keys = {
				["h"] = { "n", "v" },
				["j"] = { "n", "v" },
				["k"] = { "n", "v" },
				["l"] = { "n", "v" },
				["-"] = { "n", "v" },
				["+"] = { "n", "v" },
				["gj"] = { "n", "v" },
				["gk"] = { "n", "v" },
				["<CR>"] = { "n", "v" },
				["<C-M>"] = { "n", "v" },
				["<C-N>"] = { "n", "v" },
				["<C-P>"] = {},
			},
		},
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

	{
		"stevearc/aerial.nvim",
		opts = {
			layout = {
				max_with = { 40, 0.5 },
				min_width = 20,
			},
		},
		keys = {
			{ "<leader>lo", "<cmd>AerialToggle!<cr>" },
		},
	},
}
