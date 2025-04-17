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
	opts = {
		bigfile = { enabled = true },
		indent = { animate = { enabled = false } },
		lazygit = { enabled = true },
		statuscolumn = { enabled = true },
		zen = { toggles = { dim = false } },

		dashboard = { enabled = false },
		scroll = { enabled = false },
		input = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = false },
		words = { enabled = false },
	},
}
