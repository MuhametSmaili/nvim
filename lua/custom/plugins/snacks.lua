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
		indent = { enabled = true, animate = { enabled = false } },
		lazygit = { enabled = true },
		statuscolumn = { enabled = true },
		zen = { enabled = true, toggles = { dim = false } },
		explorer = { enabled = true, replace_netrw = true },
		quickfile = { enabled = true },
		picker = {
			sources = {
				explorer = {
					hidden = true,
					ignored = false,
					actions = {
						search_list = function(picker)
							picker:action("focus_list")
							vim.fn.feedkeys("/", "n")
						end,
						search_list_r = function(picker)
							picker:action("focus_list")
							vim.fn.feedkeys("?", "n")
						end,
						copy_vim = function(_, item)
							require("custom.utils.snacks_picker").make_copy_action('"')(_, item)
						end,
						copy_clip = function(_, item)
							require("custom.utils.snacks_picker").make_copy_action('"')(_, item)
						end,
						cycle_layouts = function(picker)
							return require("custom.utils.snacks_picker").set_next_preferred_layout(picker)
						end,
						explorer_copy_default = function(picker, item)
							require("custom.utils.snacks_picker").explorer_copy_default(picker, item)
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
								["y"] = { "copy_vim", desc = "Yank to vim" },
								["Y"] = { "copy_clip", desc = "Yank to clipboard" },
								["<cr>"] = { { "pick_win", "jump" }, mode = { "n", "i" }, desc = "Pick window" },
								["<c-w>c"] = { "cycle_layouts", mode = { "i", "n" } }, -- overids the input focus
								["c"] = "explorer_copy_default",
							},
						},
					},
					auto_close = true,
					layout = {
						preset = function()
							return require("custom.utils.snacks_picker").preferred_layout()
						end,
						auto_hide = { "input" },
						cycle = true,
					},
				},
			},
		},

		dashboard = { enabled = false },
		scroll = { enabled = false },
		input = { enabled = false },
		notifier = { enabled = false },
		words = { enabled = false },
	},
}
