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
		{
			"<leader>e",
			function()
				require("snacks").explorer()
			end,
			desc = "Open explorer",
		},
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
					actions = {
						search_list = function(picker)
							picker:action("focus_list")
							vim.fn.feedkeys("/", "n")
						end,
						search_list_r = function(picker)
							picker:action("focus_list")
							vim.fn.feedkeys("?", "n")
						end,
					},
					win = {
						list = {
							wo = {
								relativenumber = true,
							},
							keys = {
								["/"] = { "search_list", mode = { "n" }, desc = "Search list" },
								["?"] = { "search_list_r", mode = { "n" }, desc = "Search list reverse" },
								["g?"] = { "toggle_help_list" },
								["F"] = { "toggle_focus", desc = "Filter tree" },
							},
						},
					},
					auto_close = true,
					layout = {
						preset = "vertical",
						cycle = true,
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
