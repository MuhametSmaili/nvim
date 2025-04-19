return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{
			"<leader>gg",
			function()
				require("snacks").lazygit.open()
			end,
			desc = "Open LazyGit",
		},
		{
			"<leader>uc",
			function()
				require("snacks").zen()
			end,
			desc = "Open center mode",
		},
		-- {
		-- 	"<leader>.",
		-- 	function()
		-- 		require("snacks").scratch()
		-- 	end,
		-- 	desc = "Toggle Scratch Buffer",
		-- },
		-- {
		-- 	"<leader>S",
		-- 	function()
		-- 		require("snacks").scratch.select()
		-- 	end,
		-- 	desc = "Select Scratch Buffer",
		-- },
	},
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		indent = { animate = { enabled = false } },
		lazygit = { enabled = true },
		statuscolumn = { enabled = true },
		zen = { toggles = { dim = false } },
		explorer = { enabled = true, replace_netrw = true },
		picker = {
			sources = {
				explorer = {
					auto_close = true,
					layout = {
						preset = "vertical",
						cycle = true,
						-- layout = {
						-- 	box = "horizontal",
						-- 	position = "float",
						-- 	height = 0.95,
						-- 	width = 0,
						-- 	border = "rounded",
						-- 	{
						-- 		box = "vertical",
						-- 		width = 40,
						-- 		min_width = 40,
						-- 		{ win = "input", height = 1, title = "{title} {live} {flags}", border = "single" },
						-- 		{ win = "list" },
						-- 	},
						-- 	{ win = "preview", width = 0, border = "left" },
						-- },
					},
				},
			},
		},
		quickfile = { enabled = true },

		dashboard = { enabled = false },
		scroll = { enabled = false },
		input = { enabled = false },
		notifier = { enabled = false },
		words = { enabled = false },
	},
}
